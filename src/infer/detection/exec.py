# import os
# import object_detection
# import tensorflow as tf
# from object_detection.utils import config_util
# from object_detection.protos import pipeline_pb2
# from google.protobuf import text_format
# from object_detection.utils import label_map_util
# from object_detection.utils import visualization_utils as viz_utils
# from object_detection.builders import model_builder
# from object_detection.utils import config_util
# import cv2
# import numpy as np
# from matplotlib import pyplot as plt
# %matplotlib inline
#
#
# def exec():
#     CUSTOM_MODEL_NAME = 'martin_ml_26'
#     IMAGE_DIR_NAME = 'martin_ml_13'
#     TRAIN_STEP_NUM = '10000'
#     # チュートリアルのモデル
#     # PRETRAINED_MODEL_NAME = 'ssd_mobilenet_v2_fpnlite_320x320_coco17_tpu-8'
#     PRETRAINED_MODEL_NAME = 'ssd_mobilenet_v2_fpnlite_640x640_coco17_tpu-8'
#     # PRETRAINED_MODEL_NAME = 'ssd_resnet152_v1_fpn_1024x1024_coco17_tpu-8'
#     # PRETRAINED_MODEL_NAME = 'efficientdet_d2_coco17_tpu-32'
#     # PRETRAINED_MODEL_NAME = 'efficientdet_d0_coco17_tpu-32'
#     # PRETRAINED_MODEL_NAME = 'efficientdet_d7_coco17_tpu-32'
#     # PRETRAINED_MODEL_URL = 'http://download.tensorflow.org/models/object_detection/tf2/20200711/ssd_mobilenet_v2_fpnlite_320x320_coco17_tpu-8.tar.gz'
#     PRETRAINED_MODEL_URL = 'http://download.tensorflow.org/models/object_detection/tf2/20200711/ssd_mobilenet_v2_fpnlite_640x640_coco17_tpu-8.tar.gz'
#     # PRETRAINED_MODEL_URL = 'http://download.tensorflow.org/models/object_detection/tf2/20200711/efficientdet_d2_coco17_tpu-32.tar.gz'
#     # PRETRAINED_MODEL_URL = 'http://download.tensorflow.org/models/object_detection/tf2/20200711/efficientdet_d0_coco17_tpu-32.tar.gz'
#     # PRETRAINED_MODEL_URL = 'http://download.tensorflow.org/models/object_detection/tf2/20200711/efficientdet_d7_coco17_tpu-32.tar.gz'
#     TF_RECORD_SCRIPT_NAME = 'generate_tfrecord.py'
#     LABEL_MAP_NAME = 'label_map.pbtxt'
#
#
#     pathForColab = os.path.join('content', 'drive', 'MyDrive', 'mahjong_detector', '', )
#     paths = {
#         'WORKSPACE_PATH': os.path.join(pathPrefixForColab, 'Tensorflow', 'workspace'),
#         'SCRIPTS_PATH': os.path.join(pathPrefixForColab, 'Tensorflow','scripts'),
#         'APIMODEL_PATH': os.path.join(pathPrefixForColab, 'Tensorflow','models'),
#         'ANNOTATION_PATH': os.path.join(pathPrefixForColab, 'Tensorflow', 'workspace','annotations'),
#         'IMAGE_PATH': os.path.join(pathPrefixForColab, 'Tensorflow', 'workspace','images', IMAGE_DIR_NAME),
#         'MODEL_PATH': os.path.join(pathPrefixForColab, 'Tensorflow', 'workspace','models'),
#         'PRETRAINED_MODEL_PATH': os.path.join(pathPrefixForColab, 'Tensorflow', 'workspace','pre-trained-models'),
#         'CHECKPOINT_PATH': os.path.join(pathPrefixForColab, 'Tensorflow', 'workspace','models',CUSTOM_MODEL_NAME),
#         'OUTPUT_PATH': os.path.join(pathPrefixForColab, 'Tensorflow', 'workspace','models',CUSTOM_MODEL_NAME, 'export'),
#         'TFJS_PATH':os.path.join(pathPrefixForColab, 'Tensorflow', 'workspace','models',CUSTOM_MODEL_NAME, 'tfjsexport'),
#         'TFLITE_PATH':os.path.join(pathPrefixForColab, 'Tensorflow', 'workspace','models',CUSTOM_MODEL_NAME, 'tfliteexport'),
#         'PROTOC_PATH':os.path.join(pathPrefixForColab, 'Tensorflow','protoc')
#     }
#
#     files = {
#          'PIPELINE_CONFIG':os.path.join(pathPrefixForColab, 'Tensorflow', 'workspace','models', CUSTOM_MODEL_NAME, 'pipeline.config'),
#          'TF_RECORD_SCRIPT': os.path.join(paths['SCRIPTS_PATH'], TF_RECORD_SCRIPT_NAME),
#          'LABELMAP': os.path.join(paths['ANNOTATION_PATH'], LABEL_MAP_NAME)
#     }
#
#     for path in paths.values():
#         if not os.path.exists(path):
#             if os.name == 'posix':
#                 !mkdir -p {path}
#             if os.name == 'nt':
#                 !mkdir {path}
#
#     if os.name=='nt':
#         !pip install wget
#         import wget
#
#     if not os.path.exists(os.path.join(paths['APIMODEL_PATH'], 'research', 'object_detection')):
#         !git clone https://github.com/tensorflow/models {paths['APIMODEL_PATH']}
#
#     # Install Tensorflow Object Detection
#     if os.name=='posix':
#         !apt-get install protobuf-compiler
#         # verificationでobject_detection/packages/tf2/setup.pyがないって怒られたらhttps://github.com/tensorflow/modelsからコピーしてくる
#         !cd /content/drive/MyDrive/mahjong_detector/20230327mahjong_dataset/TFODCourse/Tensorflow/models/research && protoc object_detection/protos/*.proto --python_out=. && cp object_detection/packages/tf2/setup.py . && python -m pip install .
#
#     if os.name=='nt':
#         url="https://github.com/protocolbuffers/protobuf/releases/download/v3.15.6/protoc-3.15.6-win64.zip"
#         wget.download(url)
#         !move protoc-3.15.6-win64.zip {paths['PROTOC_PATH']}
#         !cd {paths['PROTOC_PATH']} && tar -xf protoc-3.15.6-win64.zip
#         os.environ['PATH'] += os.pathsep + os.path.abspath(os.path.join(paths['PROTOC_PATH'], 'bin'))
#         !cd Tensorflow/models/research && protoc object_detection/protos/*.proto --python_out=. && copy object_detection\\packages\\tf2\\setup.py setup.py && python setup.py build && python setup.py install
#         !cd Tensorflow/models/research/slim && pip install -e .
#
#     !pip install tensorflow --upgrade
#     !pip uninstall protobuf matplotlib -y
#     !pip install protobuf matplotlib==3.2
#     !pip list
#     if os.name =='posix':
#         !wget {PRETRAINED_MODEL_URL}
#         !mv {PRETRAINED_MODEL_NAME+'.tar.gz'} {paths['PRETRAINED_MODEL_PATH']}
#         !cd {paths['PRETRAINED_MODEL_PATH']} && tar -zxvf {PRETRAINED_MODEL_NAME+'.tar.gz'}
#     if os.name == 'nt':
#         wget.download(PRETRAINED_MODEL_URL)
#         !move {PRETRAINED_MODEL_NAME+'.tar.gz'} {paths['PRETRAINED_MODEL_PATH']}
#         !cd {paths['PRETRAINED_MODEL_PATH']} && tar -zxvf {PRETRAINED_MODEL_NAME+'.tar.gz'}
#
#     labels = [{'name':'1m', 'id':1},
#     {'name':'2m', 'id':2},
#     {'name':'3m', 'id':3},
#     {'name':'4m', 'id':4},
#     {'name':'5m', 'id':5},
#     {'name':'6m', 'id':6},
#     {'name':'7m', 'id':7},
#     {'name':'8m', 'id':8},
#     {'name':'9m', 'id':9},
#     {'name':'1s', 'id':10},
#     {'name':'2s', 'id':11},
#     {'name':'3s', 'id':12},
#     {'name':'4s', 'id':13},
#     {'name':'5s', 'id':14},
#     {'name':'6s', 'id':15},
#     {'name':'7s', 'id':16},
#     {'name':'8s', 'id':17},
#     {'name':'9s', 'id':18},
#     {'name':'1p', 'id':19},
#     {'name':'2p', 'id':20},
#     {'name':'3p', 'id':21},
#     {'name':'4p', 'id':22},
#     {'name':'5p', 'id':23},
#     {'name':'6p', 'id':24},
#     {'name':'7p', 'id':25},
#     {'name':'8p', 'id':26},
#     {'name':'9p', 'id':27},
#     {'name':'haku', 'id':28},
#     {'name':'hatsu', 'id':29},
#     {'name':'chun', 'id':30},
#     {'name':'ton', 'id':31},
#     {'name':'nan', 'id':32},
#     {'name':'sha', 'id':33},
#     {'name':'pe', 'id':34},
#     {'name':'5ma', 'id':35},
#     {'name':'5pa', 'id':36},
#     {'name':'5sa', 'id':37}]
#     with open(files['LABELMAP'], 'w') as f:
#         for label in labels:
#             f.write('item { \n')
#             f.write('\tname:\'{}\'\n'.format(label['name']))
#             f.write('\tid:{}\n'.format(label['id']))
#             f.write('}\n')
#
#     # OPTIONAL IF RUNNING ON COLAB
#     ARCHIVE_FILES = os.path.join(paths['IMAGE_PATH'], 'archive.tar.gz')
#     if os.path.exists(ARCHIVE_FILES):
#       !tar -zxvf {ARCHIVE_FILES}
#
#     if not os.path.exists(files['TF_RECORD_SCRIPT']):
#         !git clone https://github.com/nicknochnack/GenerateTFRecord {paths['SCRIPTS_PATH']}
#
#     !pip install protobuf==3.19.4
#
#     # builderがねぇって怒られるのの解決 参照　https://qiita.com/johnpapapa/items/e7e06f2480251102d16d
#     #!python3 -m pip show protobuf | grep Location
#     !cp /content/drive/MyDrive/mahjong_detector/builder.py /usr/local/lib/python3.9/dist-packages/google/protobuf/internal/builder.py
#     !python {files['TF_RECORD_SCRIPT']} -x {os.path.join(paths['IMAGE_PATH'], 'train')} -l {files['LABELMAP']} -o {os.path.join(paths['ANNOTATION_PATH'], 'train.record')}
#     !python {files['TF_RECORD_SCRIPT']} -x {os.path.join(paths['IMAGE_PATH'], 'test')} -l {files['LABELMAP']} -o {os.path.join(paths['ANNOTATION_PATH'], 'test.record')}
#
#     if os.name =='posix':
#         !cp {os.path.join(paths['PRETRAINED_MODEL_PATH'], PRETRAINED_MODEL_NAME, 'pipeline.config')} {os.path.join(paths['CHECKPOINT_PATH'])}
#     if os.name == 'nt':
#         !copy {os.path.join(paths['PRETRAINED_MODEL_PATH'], PRETRAINED_MODEL_NAME, 'pipeline.config')} {os.path.join(paths['CHECKPOINT_PATH'])}
#
#
#     config = config_util.get_configs_from_pipeline_file(files['PIPELINE_CONFIG'])
#
#     pipeline_config = pipeline_pb2.TrainEvalPipelineConfig()
#     with tf.io.gfile.GFile(files['PIPELINE_CONFIG'], "r") as f:
#         proto_str = f.read()
#         text_format.Merge(proto_str, pipeline_config)
#
#     pipeline_config.model.ssd.num_classes = len(labels)
#     pipeline_config.train_config.batch_size = 4
#     pipeline_config.train_config.fine_tune_checkpoint = os.path.join(paths['PRETRAINED_MODEL_PATH'], PRETRAINED_MODEL_NAME, 'checkpoint', 'ckpt-0')
#     pipeline_config.train_config.fine_tune_checkpoint_type = "detection"
#     pipeline_config.train_input_reader.label_map_path= files['LABELMAP']
#     pipeline_config.train_input_reader.tf_record_input_reader.input_path[:] = [os.path.join(paths['ANNOTATION_PATH'], 'train.record')]
#     pipeline_config.eval_input_reader[0].label_map_path = files['LABELMAP']
#     pipeline_config.eval_input_reader[0].tf_record_input_reader.input_path[:] = [os.path.join(paths['ANNOTATION_PATH'], 'test.record')]
#
#     config_text = text_format.MessageToString(pipeline_config)
#     with tf.io.gfile.GFile(files['PIPELINE_CONFIG'], "wb") as f:
#         f.write(config_text)
#
#     category_index = label_map_util.create_category_index_from_labelmap(files['LABELMAP'])
#
#     IMAGE_PATH = os.path.join(paths['IMAGE_PATH'], 'test', 'LINE_ALBUM_230323_0.jpg')
#
#     img = cv2.imread(IMAGE_PATH)
#     image_np = np.array(img)
#
#     input_tensor = tf.convert_to_tensor(np.expand_dims(image_np, 0), dtype=tf.float32)
#     detections = detect_fn(input_tensor)
#
#     num_detections = int(detections.pop('num_detections'))
#     detections = {key: value[0, :num_detections].numpy()
#                   for key, value in detections.items()}
#     detections['num_detections'] = num_detections
#
#     # detection_classes should be ints.
#     detections['detection_classes'] = detections['detection_classes'].astype(np.int64)
#
#     label_id_offset = 1
#     image_np_with_detections = image_np.copy()
#
#     viz_utils.visualize_boxes_and_labels_on_image_array(
#                 image_np_with_detections,
#                 detections['detection_boxes'],
#                 detections['detection_classes']+label_id_offset,
#                 detections['detection_scores'],
#                 category_index,
#                 use_normalized_coordinates=True,
#                 max_boxes_to_draw=5,
#                 min_score_thresh=.8,
#                 agnostic_mode=False)
#
#     plt.imshow(cv2.cvtColor(image_np_with_detections, cv2.COLOR_BGR2RGB))
#     plt.show()