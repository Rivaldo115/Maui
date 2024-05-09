; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [112 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [224 x i32] [
	i32 38948123, ; 0: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 0
	i32 42244203, ; 1: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 9
	i32 42639949, ; 2: System.Threading.Thread => 0x28aa24d => 104
	i32 67008169, ; 3: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 4: Microsoft.Maui.Graphics.dll => 0x44bb714 => 47
	i32 83839681, ; 5: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 17
	i32 117431740, ; 6: System.Runtime.InteropServices => 0x6ffddbc => 97
	i32 136584136, ; 7: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 32
	i32 140062828, ; 8: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 25
	i32 165246403, ; 9: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 52
	i32 182336117, ; 10: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 70
	i32 205061960, ; 11: System.ComponentModel => 0xc38ff48 => 82
	i32 317674968, ; 12: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 13: Xamarin.AndroidX.Activity.dll => 0x13031348 => 48
	i32 321963286, ; 14: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 8
	i32 342366114, ; 15: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 59
	i32 379916513, ; 16: System.Threading.Thread.dll => 0x16a510e1 => 104
	i32 385762202, ; 17: System.Memory.dll => 0x16fe439a => 89
	i32 395744057, ; 18: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 409257351, ; 19: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 28
	i32 442565967, ; 20: System.Collections => 0x1a61054f => 79
	i32 450948140, ; 21: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 58
	i32 469710990, ; 22: System.dll => 0x1bff388e => 107
	i32 489220957, ; 23: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 6
	i32 498788369, ; 24: System.ObjectModel => 0x1dbae811 => 94
	i32 513247710, ; 25: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 42
	i32 538707440, ; 26: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 27
	i32 539058512, ; 27: Microsoft.Extensions.Logging => 0x20216150 => 39
	i32 627609679, ; 28: Xamarin.AndroidX.CustomView => 0x2568904f => 56
	i32 627931235, ; 29: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 30: System.Text.Encodings.Web.dll => 0x27787397 => 101
	i32 672442732, ; 31: System.Collections.Concurrent => 0x2814a96c => 77
	i32 722857257, ; 32: System.Runtime.Loader.dll => 0x2b15ed29 => 98
	i32 759454413, ; 33: System.Net.Requests => 0x2d445acd => 92
	i32 775507847, ; 34: System.IO.Compression => 0x2e394f87 => 86
	i32 777317022, ; 35: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 36: Microsoft.Extensions.Options => 0x2f0980eb => 41
	i32 823281589, ; 37: System.Private.Uri.dll => 0x311247b5 => 95
	i32 830298997, ; 38: System.IO.Compression.Brotli => 0x317d5b75 => 85
	i32 869139383, ; 39: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 10
	i32 880668424, ; 40: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 24
	i32 904024072, ; 41: System.ComponentModel.Primitives.dll => 0x35e25008 => 80
	i32 918734561, ; 42: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 21
	i32 961460050, ; 43: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 14
	i32 967690846, ; 44: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 59
	i32 990727110, ; 45: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 23
	i32 992768348, ; 46: System.Collections.dll => 0x3b2c715c => 79
	i32 1012816738, ; 47: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 69
	i32 1028951442, ; 48: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 38
	i32 1035644815, ; 49: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 49
	i32 1043950537, ; 50: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 4
	i32 1044663988, ; 51: System.Linq.Expressions.dll => 0x3e444eb4 => 87
	i32 1052210849, ; 52: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 61
	i32 1082857460, ; 53: System.ComponentModel.TypeConverter => 0x408b17f4 => 81
	i32 1084122840, ; 54: Xamarin.Kotlin.StdLib => 0x409e66d8 => 74
	i32 1098259244, ; 55: System => 0x41761b2c => 107
	i32 1108272742, ; 56: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 26
	i32 1117529484, ; 57: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 20
	i32 1118262833, ; 58: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 59: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 60: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 66
	i32 1260983243, ; 61: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 62: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 57
	i32 1308624726, ; 63: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 11
	i32 1324164729, ; 64: System.Linq => 0x4eed2679 => 88
	i32 1336711579, ; 65: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 31
	i32 1373134921, ; 66: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 67: Xamarin.AndroidX.SavedState => 0x52114ed3 => 69
	i32 1406073936, ; 68: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 53
	i32 1430672901, ; 69: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1461004990, ; 70: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1462112819, ; 71: System.IO.Compression.dll => 0x57261233 => 86
	i32 1469204771, ; 72: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 50
	i32 1470490898, ; 73: Microsoft.Extensions.Primitives => 0x57a5e912 => 42
	i32 1480492111, ; 74: System.IO.Compression.Brotli.dll => 0x583e844f => 85
	i32 1526286932, ; 75: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 30
	i32 1543031311, ; 76: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 103
	i32 1591890998, ; 77: MovilAPP1 => 0x5ee25436 => 76
	i32 1622152042, ; 78: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 63
	i32 1624863272, ; 79: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 72
	i32 1636350590, ; 80: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 55
	i32 1639515021, ; 81: System.Net.Http.dll => 0x61b9038d => 90
	i32 1639986890, ; 82: System.Text.RegularExpressions => 0x61c036ca => 103
	i32 1657153582, ; 83: System.Runtime => 0x62c6282e => 99
	i32 1658251792, ; 84: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 73
	i32 1677501392, ; 85: System.Net.Primitives.dll => 0x63fca3d0 => 91
	i32 1679769178, ; 86: System.Security.Cryptography => 0x641f3e5a => 100
	i32 1729485958, ; 87: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 51
	i32 1743415430, ; 88: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1766324549, ; 89: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 70
	i32 1770582343, ; 90: Microsoft.Extensions.Logging.dll => 0x6988f147 => 39
	i32 1780572499, ; 91: Mono.Android.Runtime.dll => 0x6a216153 => 110
	i32 1782862114, ; 92: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 93: Xamarin.AndroidX.Fragment => 0x6a96652d => 58
	i32 1793755602, ; 94: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 95: Xamarin.AndroidX.Loader => 0x6bcd3296 => 63
	i32 1813058853, ; 96: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 74
	i32 1813201214, ; 97: Xamarin.Google.Android.Material => 0x6c13413e => 73
	i32 1818569960, ; 98: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 67
	i32 1828688058, ; 99: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 40
	i32 1853025655, ; 100: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 101: System.Linq.Expressions => 0x6ec71a65 => 87
	i32 1875935024, ; 102: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1893218855, ; 103: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 2
	i32 1910275211, ; 104: System.Collections.NonGeneric.dll => 0x71dc7c8b => 78
	i32 1953182387, ; 105: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 13
	i32 1968388702, ; 106: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 35
	i32 2003115576, ; 107: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 108: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 61
	i32 2045470958, ; 109: System.Private.Xml => 0x79eb68ee => 96
	i32 2055257422, ; 110: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 60
	i32 2066184531, ; 111: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2079903147, ; 112: System.Runtime.dll => 0x7bf8cdab => 99
	i32 2090596640, ; 113: System.Numerics.Vectors => 0x7c9bf920 => 93
	i32 2127167465, ; 114: System.Console => 0x7ec9ffe9 => 83
	i32 2159891885, ; 115: Microsoft.Maui => 0x80bd55ad => 45
	i32 2169148018, ; 116: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 117: Microsoft.Extensions.Options.dll => 0x820d22b3 => 41
	i32 2192057212, ; 118: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 40
	i32 2193016926, ; 119: System.ObjectModel.dll => 0x82b6c85e => 94
	i32 2201107256, ; 120: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 75
	i32 2201231467, ; 121: System.Net.Http => 0x8334206b => 90
	i32 2207618523, ; 122: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2266799131, ; 123: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 36
	i32 2279755925, ; 124: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 68
	i32 2303942373, ; 125: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 126: System.Private.CoreLib.dll => 0x896b7878 => 108
	i32 2353062107, ; 127: System.Net.Primitives => 0x8c40e0db => 91
	i32 2366048013, ; 128: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 12
	i32 2368005991, ; 129: System.Xml.ReaderWriter.dll => 0x8d24e767 => 106
	i32 2371007202, ; 130: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 35
	i32 2395872292, ; 131: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2427813419, ; 132: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 133: System.Console.dll => 0x912896e5 => 83
	i32 2475788418, ; 134: Java.Interop.dll => 0x93918882 => 109
	i32 2480646305, ; 135: Microsoft.Maui.Controls => 0x93dba8a1 => 43
	i32 2503351294, ; 136: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 16
	i32 2550873716, ; 137: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2570120770, ; 138: System.Text.Encodings.Web => 0x9930ee42 => 101
	i32 2576534780, ; 139: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 15
	i32 2593496499, ; 140: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 141: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 75
	i32 2617129537, ; 142: System.Private.Xml.dll => 0x9bfe3a41 => 96
	i32 2620871830, ; 143: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 55
	i32 2626831493, ; 144: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2663698177, ; 145: System.Runtime.Loader => 0x9ec4cf01 => 98
	i32 2732626843, ; 146: Xamarin.AndroidX.Activity => 0xa2e0939b => 48
	i32 2737747696, ; 147: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 50
	i32 2740698338, ; 148: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 1
	i32 2752995522, ; 149: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 150: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 44
	i32 2764765095, ; 151: Microsoft.Maui.dll => 0xa4caf7a7 => 45
	i32 2778768386, ; 152: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 71
	i32 2785988530, ; 153: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 154: Microsoft.Maui.Graphics => 0xa7008e0b => 47
	i32 2810250172, ; 155: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 53
	i32 2853208004, ; 156: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 71
	i32 2861189240, ; 157: Microsoft.Maui.Essentials => 0xaa8a4878 => 46
	i32 2909740682, ; 158: System.Private.CoreLib => 0xad6f1e8a => 108
	i32 2916838712, ; 159: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 72
	i32 2919462931, ; 160: System.Numerics.Vectors.dll => 0xae037813 => 93
	i32 2959614098, ; 161: System.ComponentModel.dll => 0xb0682092 => 82
	i32 2978675010, ; 162: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 57
	i32 3038032645, ; 163: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3053864966, ; 164: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 7
	i32 3057625584, ; 165: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 64
	i32 3059408633, ; 166: Mono.Android.Runtime => 0xb65adef9 => 110
	i32 3059793426, ; 167: System.ComponentModel.Primitives => 0xb660be12 => 80
	i32 3178803400, ; 168: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 65
	i32 3220365878, ; 169: System.Threading => 0xbff2e236 => 105
	i32 3258312781, ; 170: Xamarin.AndroidX.CardView => 0xc235e84d => 51
	i32 3265105062, ; 171: MovilAPP1.dll => 0xc29d8ca6 => 76
	i32 3305363605, ; 172: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 173: System.Net.Requests.dll => 0xc5b097e4 => 92
	i32 3317135071, ; 174: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 56
	i32 3346324047, ; 175: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 66
	i32 3357674450, ; 176: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 177: System.Text.Json => 0xc82afec1 => 102
	i32 3362522851, ; 178: Xamarin.AndroidX.Core => 0xc86c06e3 => 54
	i32 3366347497, ; 179: Java.Interop => 0xc8a662e9 => 109
	i32 3374999561, ; 180: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 68
	i32 3381016424, ; 181: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 182: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 37
	i32 3458724246, ; 183: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 22
	i32 3471940407, ; 184: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 81
	i32 3476120550, ; 185: Mono.Android => 0xcf3163e6 => 111
	i32 3484440000, ; 186: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 187: System.Text.Json.dll => 0xcfbaacae => 102
	i32 3580758918, ; 188: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3592228221, ; 189: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 33
	i32 3608519521, ; 190: System.Linq.dll => 0xd715a361 => 88
	i32 3641597786, ; 191: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 60
	i32 3643446276, ; 192: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 193: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 65
	i32 3657292374, ; 194: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 36
	i32 3672681054, ; 195: Mono.Android.dll => 0xdae8aa5e => 111
	i32 3724971120, ; 196: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 64
	i32 3748608112, ; 197: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 84
	i32 3751619990, ; 198: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 3
	i32 3786282454, ; 199: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 52
	i32 3792276235, ; 200: System.Collections.NonGeneric => 0xe2098b0b => 78
	i32 3823082795, ; 201: System.Security.Cryptography.dll => 0xe3df9d2b => 100
	i32 3841636137, ; 202: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 38
	i32 3849253459, ; 203: System.Runtime.InteropServices.dll => 0xe56ef253 => 97
	i32 3896106733, ; 204: System.Collections.Concurrent.dll => 0xe839deed => 77
	i32 3896760992, ; 205: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 54
	i32 3920221145, ; 206: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 19
	i32 3928044579, ; 207: System.Xml.ReaderWriter => 0xea213423 => 106
	i32 3931092270, ; 208: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 67
	i32 3955647286, ; 209: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 49
	i32 4025784931, ; 210: System.Memory => 0xeff49a63 => 89
	i32 4046471985, ; 211: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 44
	i32 4073602200, ; 212: System.Threading.dll => 0xf2ce3c98 => 105
	i32 4091086043, ; 213: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 5
	i32 4094352644, ; 214: Microsoft.Maui.Essentials.dll => 0xf40add04 => 46
	i32 4100113165, ; 215: System.Private.Uri => 0xf462c30d => 95
	i32 4103439459, ; 216: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 29
	i32 4126470640, ; 217: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 37
	i32 4150914736, ; 218: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4182413190, ; 219: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 62
	i32 4213026141, ; 220: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 84
	i32 4249188766, ; 221: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 18
	i32 4271975918, ; 222: Microsoft.Maui.Controls.dll => 0xfea12dee => 43
	i32 4292120959 ; 223: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 62
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [224 x i32] [
	i32 0, ; 0
	i32 9, ; 1
	i32 104, ; 2
	i32 33, ; 3
	i32 47, ; 4
	i32 17, ; 5
	i32 97, ; 6
	i32 32, ; 7
	i32 25, ; 8
	i32 52, ; 9
	i32 70, ; 10
	i32 82, ; 11
	i32 30, ; 12
	i32 48, ; 13
	i32 8, ; 14
	i32 59, ; 15
	i32 104, ; 16
	i32 89, ; 17
	i32 34, ; 18
	i32 28, ; 19
	i32 79, ; 20
	i32 58, ; 21
	i32 107, ; 22
	i32 6, ; 23
	i32 94, ; 24
	i32 42, ; 25
	i32 27, ; 26
	i32 39, ; 27
	i32 56, ; 28
	i32 19, ; 29
	i32 101, ; 30
	i32 77, ; 31
	i32 98, ; 32
	i32 92, ; 33
	i32 86, ; 34
	i32 25, ; 35
	i32 41, ; 36
	i32 95, ; 37
	i32 85, ; 38
	i32 10, ; 39
	i32 24, ; 40
	i32 80, ; 41
	i32 21, ; 42
	i32 14, ; 43
	i32 59, ; 44
	i32 23, ; 45
	i32 79, ; 46
	i32 69, ; 47
	i32 38, ; 48
	i32 49, ; 49
	i32 4, ; 50
	i32 87, ; 51
	i32 61, ; 52
	i32 81, ; 53
	i32 74, ; 54
	i32 107, ; 55
	i32 26, ; 56
	i32 20, ; 57
	i32 16, ; 58
	i32 22, ; 59
	i32 66, ; 60
	i32 2, ; 61
	i32 57, ; 62
	i32 11, ; 63
	i32 88, ; 64
	i32 31, ; 65
	i32 32, ; 66
	i32 69, ; 67
	i32 53, ; 68
	i32 0, ; 69
	i32 6, ; 70
	i32 86, ; 71
	i32 50, ; 72
	i32 42, ; 73
	i32 85, ; 74
	i32 30, ; 75
	i32 103, ; 76
	i32 76, ; 77
	i32 63, ; 78
	i32 72, ; 79
	i32 55, ; 80
	i32 90, ; 81
	i32 103, ; 82
	i32 99, ; 83
	i32 73, ; 84
	i32 91, ; 85
	i32 100, ; 86
	i32 51, ; 87
	i32 1, ; 88
	i32 70, ; 89
	i32 39, ; 90
	i32 110, ; 91
	i32 17, ; 92
	i32 58, ; 93
	i32 9, ; 94
	i32 63, ; 95
	i32 74, ; 96
	i32 73, ; 97
	i32 67, ; 98
	i32 40, ; 99
	i32 26, ; 100
	i32 87, ; 101
	i32 8, ; 102
	i32 2, ; 103
	i32 78, ; 104
	i32 13, ; 105
	i32 35, ; 106
	i32 5, ; 107
	i32 61, ; 108
	i32 96, ; 109
	i32 60, ; 110
	i32 4, ; 111
	i32 99, ; 112
	i32 93, ; 113
	i32 83, ; 114
	i32 45, ; 115
	i32 12, ; 116
	i32 41, ; 117
	i32 40, ; 118
	i32 94, ; 119
	i32 75, ; 120
	i32 90, ; 121
	i32 14, ; 122
	i32 36, ; 123
	i32 68, ; 124
	i32 18, ; 125
	i32 108, ; 126
	i32 91, ; 127
	i32 12, ; 128
	i32 106, ; 129
	i32 35, ; 130
	i32 13, ; 131
	i32 10, ; 132
	i32 83, ; 133
	i32 109, ; 134
	i32 43, ; 135
	i32 16, ; 136
	i32 11, ; 137
	i32 101, ; 138
	i32 15, ; 139
	i32 20, ; 140
	i32 75, ; 141
	i32 96, ; 142
	i32 55, ; 143
	i32 15, ; 144
	i32 98, ; 145
	i32 48, ; 146
	i32 50, ; 147
	i32 1, ; 148
	i32 21, ; 149
	i32 44, ; 150
	i32 45, ; 151
	i32 71, ; 152
	i32 27, ; 153
	i32 47, ; 154
	i32 53, ; 155
	i32 71, ; 156
	i32 46, ; 157
	i32 108, ; 158
	i32 72, ; 159
	i32 93, ; 160
	i32 82, ; 161
	i32 57, ; 162
	i32 34, ; 163
	i32 7, ; 164
	i32 64, ; 165
	i32 110, ; 166
	i32 80, ; 167
	i32 65, ; 168
	i32 105, ; 169
	i32 51, ; 170
	i32 76, ; 171
	i32 7, ; 172
	i32 92, ; 173
	i32 56, ; 174
	i32 66, ; 175
	i32 24, ; 176
	i32 102, ; 177
	i32 54, ; 178
	i32 109, ; 179
	i32 68, ; 180
	i32 3, ; 181
	i32 37, ; 182
	i32 22, ; 183
	i32 81, ; 184
	i32 111, ; 185
	i32 23, ; 186
	i32 102, ; 187
	i32 31, ; 188
	i32 33, ; 189
	i32 88, ; 190
	i32 60, ; 191
	i32 28, ; 192
	i32 65, ; 193
	i32 36, ; 194
	i32 111, ; 195
	i32 64, ; 196
	i32 84, ; 197
	i32 3, ; 198
	i32 52, ; 199
	i32 78, ; 200
	i32 100, ; 201
	i32 38, ; 202
	i32 97, ; 203
	i32 77, ; 204
	i32 54, ; 205
	i32 19, ; 206
	i32 106, ; 207
	i32 67, ; 208
	i32 49, ; 209
	i32 89, ; 210
	i32 44, ; 211
	i32 105, ; 212
	i32 5, ; 213
	i32 46, ; 214
	i32 95, ; 215
	i32 29, ; 216
	i32 37, ; 217
	i32 29, ; 218
	i32 62, ; 219
	i32 84, ; 220
	i32 18, ; 221
	i32 43, ; 222
	i32 62 ; 223
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ af27162bee43b7fecdca59b4f67aa8c175cbc875"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
