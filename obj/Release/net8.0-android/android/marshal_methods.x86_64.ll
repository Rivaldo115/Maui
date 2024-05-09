; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [112 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [224 x i64] [
	i64 98382396393917666, ; 0: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 42
	i64 120698629574877762, ; 1: Mono.Android => 0x1accec39cafe242 => 111
	i64 131669012237370309, ; 2: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 46
	i64 196720943101637631, ; 3: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 87
	i64 210515253464952879, ; 4: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 52
	i64 232391251801502327, ; 5: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 69
	i64 750875890346172408, ; 6: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 104
	i64 799765834175365804, ; 7: System.ComponentModel.dll => 0xb1956c9f18442ac => 82
	i64 805302231655005164, ; 8: hu\Microsoft.Maui.Controls.resources.dll => 0xb2d021ceea03bec => 12
	i64 872800313462103108, ; 9: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 57
	i64 1120440138749646132, ; 10: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 73
	i64 1369545283391376210, ; 11: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 65
	i64 1476839205573959279, ; 12: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 91
	i64 1486715745332614827, ; 13: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 43
	i64 1513467482682125403, ; 14: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 110
	i64 1537168428375924959, ; 15: System.Threading.Thread.dll => 0x15551e8a954ae0df => 104
	i64 1624659445732251991, ; 16: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 50
	i64 1628611045998245443, ; 17: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 62
	i64 1743969030606105336, ; 18: System.Memory.dll => 0x1833d297e88f2af8 => 89
	i64 1767386781656293639, ; 19: System.Private.Uri.dll => 0x188704e9f5582107 => 95
	i64 1795316252682057001, ; 20: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 49
	i64 1835311033149317475, ; 21: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 6
	i64 1836611346387731153, ; 22: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 69
	i64 1881198190668717030, ; 23: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 28
	i64 1920760634179481754, ; 24: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 44
	i64 1981742497975770890, ; 25: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 61
	i64 2262844636196693701, ; 26: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 57
	i64 2287834202362508563, ; 27: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 77
	i64 2329709569556905518, ; 28: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 60
	i64 2335503487726329082, ; 29: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 101
	i64 2470498323731680442, ; 30: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 53
	i64 2497223385847772520, ; 31: System.Runtime => 0x22a7eb7046413568 => 99
	i64 2547086958574651984, ; 32: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 48
	i64 2602673633151553063, ; 33: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 27
	i64 2656907746661064104, ; 34: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 37
	i64 2662981627730767622, ; 35: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 2
	i64 2895129759130297543, ; 36: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 7
	i64 3017704767998173186, ; 37: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 73
	i64 3289520064315143713, ; 38: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 59
	i64 3311221304742556517, ; 39: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 93
	i64 3344514922410554693, ; 40: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 75
	i64 3429672777697402584, ; 41: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 46
	i64 3494946837667399002, ; 42: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 35
	i64 3522470458906976663, ; 43: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 70
	i64 3551103847008531295, ; 44: System.Private.CoreLib.dll => 0x31480e226177735f => 108
	i64 3567343442040498961, ; 45: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 22
	i64 3571415421602489686, ; 46: System.Runtime.dll => 0x319037675df7e556 => 99
	i64 3638003163729360188, ; 47: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 36
	i64 3647754201059316852, ; 48: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 106
	i64 3655542548057982301, ; 49: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 35
	i64 3727469159507183293, ; 50: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 68
	i64 3869221888984012293, ; 51: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 39
	i64 3890352374528606784, ; 52: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 44
	i64 3933965368022646939, ; 53: System.Net.Requests => 0x369840a8bfadc09b => 92
	i64 3966267475168208030, ; 54: System.Memory => 0x370b03412596249e => 89
	i64 4070326265757318011, ; 55: da\Microsoft.Maui.Controls.resources.dll => 0x387cb42c56683b7b => 3
	i64 4073500526318903918, ; 56: System.Private.Xml.dll => 0x3887fb25779ae26e => 96
	i64 4120493066591692148, ; 57: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 33
	i64 4154383907710350974, ; 58: System.ComponentModel => 0x39a7562737acb67e => 82
	i64 4187479170553454871, ; 59: System.Linq.Expressions => 0x3a1cea1e912fa117 => 87
	i64 4205801962323029395, ; 60: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 81
	i64 4360412976914417659, ; 61: tr\Microsoft.Maui.Controls.resources.dll => 0x3c834c8002fcc7fb => 28
	i64 4794310189461587505, ; 62: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 48
	i64 4795410492532947900, ; 63: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 70
	i64 4853321196694829351, ; 64: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 98
	i64 4871824391508510238, ; 65: nb\Microsoft.Maui.Controls.resources.dll => 0x439c3278d7f2c61e => 18
	i64 4953714692329509532, ; 66: sv\Microsoft.Maui.Controls.resources.dll => 0x44bf21444aef129c => 26
	i64 5281706572937044258, ; 67: MovilAPP1 => 0x494c6424f7c22122 => 76
	i64 5290786973231294105, ; 68: System.Runtime.Loader => 0x496ca6b869b72699 => 98
	i64 5471532531798518949, ; 69: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 26
	i64 5522859530602327440, ; 70: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 29
	i64 5570799893513421663, ; 71: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 85
	i64 5573260873512690141, ; 72: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 100
	i64 5692067934154308417, ; 73: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 72
	i64 6200764641006662125, ; 74: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 23
	i64 6222399776351216807, ; 75: System.Text.Json.dll => 0x565a67a0ffe264a7 => 102
	i64 6300676701234028427, ; 76: es\Microsoft.Maui.Controls.resources.dll => 0x57708013cda25f8b => 6
	i64 6357457916754632952, ; 77: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 34
	i64 6401687960814735282, ; 78: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 60
	i64 6471714727257221498, ; 79: fi\Microsoft.Maui.Controls.resources.dll => 0x59d026417dd4a97a => 7
	i64 6478287442656530074, ; 80: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 11
	i64 6548213210057960872, ; 81: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 56
	i64 6560151584539558821, ; 82: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 41
	i64 6743165466166707109, ; 83: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 19
	i64 6894844156784520562, ; 84: System.Numerics.Vectors => 0x5faf683aead1ad72 => 93
	i64 7270811800166795866, ; 85: System.Linq => 0x64e71ccf51a90a5a => 88
	i64 7377312882064240630, ; 86: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 81
	i64 7489048572193775167, ; 87: System.ObjectModel => 0x67ee71ff6b419e3f => 94
	i64 7654504624184590948, ; 88: System.Net.Http => 0x6a3a4366801b8264 => 90
	i64 7714652370974252055, ; 89: System.Private.CoreLib => 0x6b0ff375198b9c17 => 108
	i64 7735352534559001595, ; 90: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 74
	i64 7742555799473854801, ; 91: it\Microsoft.Maui.Controls.resources.dll => 0x6b73157a51479951 => 14
	i64 7836164640616011524, ; 92: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 50
	i64 7975724199463739455, ; 93: sk\Microsoft.Maui.Controls.resources.dll => 0x6eaf76e6f785e03f => 25
	i64 8064050204834738623, ; 94: System.Collections.dll => 0x6fe942efa61731bf => 79
	i64 8083354569033831015, ; 95: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 59
	i64 8087206902342787202, ; 96: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 84
	i64 8108129031893776750, ; 97: ko\Microsoft.Maui.Controls.resources.dll => 0x7085dc65530f796e => 16
	i64 8167236081217502503, ; 98: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 109
	i64 8185542183669246576, ; 99: System.Collections => 0x7198e33f4794aa70 => 79
	i64 8246048515196606205, ; 100: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 47
	i64 8368701292315763008, ; 101: System.Security.Cryptography => 0x7423997c6fd56140 => 100
	i64 8386351099740279196, ; 102: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x74624de475b9d19c => 31
	i64 8400357532724379117, ; 103: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 67
	i64 8563666267364444763, ; 104: System.Private.Uri => 0x76d841191140ca5b => 95
	i64 8626175481042262068, ; 105: Java.Interop => 0x77b654e585b55834 => 109
	i64 8639588376636138208, ; 106: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 66
	i64 8677882282824630478, ; 107: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 21
	i64 8725526185868997716, ; 108: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 84
	i64 9045785047181495996, ; 109: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 31
	i64 9312692141327339315, ; 110: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 72
	i64 9324707631942237306, ; 111: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 49
	i64 9363564275759486853, ; 112: el\Microsoft.Maui.Controls.resources.dll => 0x81f21019382e9785 => 5
	i64 9551379474083066910, ; 113: uk\Microsoft.Maui.Controls.resources.dll => 0x848d5106bbadb41e => 29
	i64 9659729154652888475, ; 114: System.Text.RegularExpressions => 0x860e407c9991dd9b => 103
	i64 9678050649315576968, ; 115: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 53
	i64 9702891218465930390, ; 116: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 78
	i64 9773637193738963987, ; 117: ca\Microsoft.Maui.Controls.resources.dll => 0x87a2ef3ea85b4c13 => 1
	i64 9808709177481450983, ; 118: Mono.Android.dll => 0x881f890734e555e7 => 111
	i64 9956195530459977388, ; 119: Microsoft.Maui => 0x8a2b8315b36616ac => 45
	i64 10038780035334861115, ; 120: System.Net.Http.dll => 0x8b50e941206af13b => 90
	i64 10051358222726253779, ; 121: System.Private.Xml => 0x8b7d990c97ccccd3 => 96
	i64 10092835686693276772, ; 122: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 43
	i64 10143853363526200146, ; 123: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 3
	i64 10209869394718195525, ; 124: nl\Microsoft.Maui.Controls.resources.dll => 0x8db0be1ecb4f7f45 => 19
	i64 10229024438826829339, ; 125: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 56
	i64 10406448008575299332, ; 126: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 75
	i64 10430153318873392755, ; 127: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 54
	i64 10506226065143327199, ; 128: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 1
	i64 10761706286639228993, ; 129: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0x955942d988382841 => 33
	i64 10785150219063592792, ; 130: System.Net.Primitives => 0x95ac8cfb68830758 => 91
	i64 10934166458810540712, ; 131: MovilAPP1.dll => 0x97bdf6766c64a2a8 => 76
	i64 11002576679268595294, ; 132: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 40
	i64 11009005086950030778, ; 133: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 45
	i64 11103970607964515343, ; 134: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 12
	i64 11156122287428000958, ; 135: th\Microsoft.Maui.Controls.resources.dll => 0x9ad2821cdcf6dcbe => 27
	i64 11157797727133427779, ; 136: fr\Microsoft.Maui.Controls.resources.dll => 0x9ad875ea9172e843 => 8
	i64 11162124722117608902, ; 137: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 71
	i64 11220793807500858938, ; 138: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 15
	i64 11226290749488709958, ; 139: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 41
	i64 11340910727871153756, ; 140: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 55
	i64 11485890710487134646, ; 141: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 97
	i64 11518296021396496455, ; 142: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 13
	i64 11529969570048099689, ; 143: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 71
	i64 11530571088791430846, ; 144: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 39
	i64 11855031688536399763, ; 145: vi\Microsoft.Maui.Controls.resources.dll => 0xa485888294361f93 => 30
	i64 12145679461940342714, ; 146: System.Text.Json => 0xa88e1f1ebcb62fba => 102
	i64 12451044538927396471, ; 147: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 58
	i64 12466513435562512481, ; 148: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 63
	i64 12475113361194491050, ; 149: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 34
	i64 12538491095302438457, ; 150: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 51
	i64 12550732019250633519, ; 151: System.IO.Compression => 0xae2d28465e8e1b2f => 86
	i64 12700543734426720211, ; 152: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 52
	i64 12843321153144804894, ; 153: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 42
	i64 12989346753972519995, ; 154: ar\Microsoft.Maui.Controls.resources.dll => 0xb4436e0d5ee7c43b => 0
	i64 13005833372463390146, ; 155: pt-BR\Microsoft.Maui.Controls.resources.dll => 0xb47e008b5d99ddc2 => 21
	i64 13343850469010654401, ; 156: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 110
	i64 13381594904270902445, ; 157: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 9
	i64 13465488254036897740, ; 158: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 74
	i64 13540124433173649601, ; 159: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 30
	i64 13572454107664307259, ; 160: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 68
	i64 13717397318615465333, ; 161: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 80
	i64 13881769479078963060, ; 162: System.Console.dll => 0xc0a5f3cade5c6774 => 83
	i64 13959074834287824816, ; 163: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 58
	i64 14124974489674258913, ; 164: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 51
	i64 14125464355221830302, ; 165: System.Threading.dll => 0xc407bafdbc707a9e => 105
	i64 14349907877893689639, ; 166: ro\Microsoft.Maui.Controls.resources.dll => 0xc7251d2f956ed127 => 23
	i64 14461014870687870182, ; 167: System.Net.Requests.dll => 0xc8afd8683afdece6 => 92
	i64 14464374589798375073, ; 168: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 24
	i64 14491877563792607819, ; 169: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0xc91d7ddcee4fca4b => 32
	i64 14551742072151931844, ; 170: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 101
	i64 14610046442689856844, ; 171: cs\Microsoft.Maui.Controls.resources.dll => 0xcac14fd5107d054c => 2
	i64 14669215534098758659, ; 172: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 37
	i64 14705122255218365489, ; 173: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 16
	i64 14735017007120366644, ; 174: ja\Microsoft.Maui.Controls.resources.dll => 0xcc7d4be604bfbc34 => 15
	i64 14744092281598614090, ; 175: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 32
	i64 14852515768018889994, ; 176: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 55
	i64 14904040806490515477, ; 177: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 0
	i64 14954917835170835695, ; 178: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 38
	i64 14987728460634540364, ; 179: System.IO.Compression.dll => 0xcfff1ba06622494c => 86
	i64 15076659072870671916, ; 180: System.ObjectModel.dll => 0xd13b0d8c1620662c => 94
	i64 15111608613780139878, ; 181: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 17
	i64 15115185479366240210, ; 182: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 85
	i64 15133485256822086103, ; 183: System.Linq.dll => 0xd204f0a9127dd9d7 => 88
	i64 15203009853192377507, ; 184: pt\Microsoft.Maui.Controls.resources.dll => 0xd2fbf0e9984b94a3 => 22
	i64 15227001540531775957, ; 185: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 36
	i64 15370334346939861994, ; 186: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 54
	i64 15391712275433856905, ; 187: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 38
	i64 15527772828719725935, ; 188: System.Console => 0xd77dbb1e38cd3d6f => 83
	i64 15536481058354060254, ; 189: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 4
	i64 15582737692548360875, ; 190: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 62
	i64 15609085926864131306, ; 191: System.dll => 0xd89e9cf3334914ea => 107
	i64 15661133872274321916, ; 192: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 106
	i64 15783653065526199428, ; 193: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 5
	i64 16056281320585338352, ; 194: ru\Microsoft.Maui.Controls.resources.dll => 0xded35eca8f3a9df0 => 24
	i64 16154507427712707110, ; 195: System => 0xe03056ea4e39aa26 => 107
	i64 16288847719894691167, ; 196: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 18
	i64 16321164108206115771, ; 197: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 40
	i64 16649148416072044166, ; 198: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 47
	i64 16677317093839702854, ; 199: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 67
	i64 16803648858859583026, ; 200: ms\Microsoft.Maui.Controls.resources.dll => 0xe9328d9b8ab93632 => 17
	i64 16890310621557459193, ; 201: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 103
	i64 16942731696432749159, ; 202: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 25
	i64 16998075588627545693, ; 203: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 65
	i64 17008137082415910100, ; 204: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 78
	i64 17031351772568316411, ; 205: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 64
	i64 17062143951396181894, ; 206: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 80
	i64 17203614576212522419, ; 207: pl\Microsoft.Maui.Controls.resources.dll => 0xeebf844ef3e135b3 => 20
	i64 17310278548634113468, ; 208: hi\Microsoft.Maui.Controls.resources.dll => 0xf03a76a04e6695bc => 10
	i64 17342750010158924305, ; 209: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 10
	i64 17514990004910432069, ; 210: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 8
	i64 17623389608345532001, ; 211: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 20
	i64 17704177640604968747, ; 212: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 63
	i64 17710060891934109755, ; 213: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 61
	i64 17712670374920797664, ; 214: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 97
	i64 17827813215687577648, ; 215: hr\Microsoft.Maui.Controls.resources.dll => 0xf7691da9f3129030 => 11
	i64 17942426894774770628, ; 216: de\Microsoft.Maui.Controls.resources.dll => 0xf9004e329f771bc4 => 4
	i64 18025913125965088385, ; 217: System.Threading => 0xfa28e87b91334681 => 105
	i64 18121036031235206392, ; 218: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 64
	i64 18245806341561545090, ; 219: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 77
	i64 18305135509493619199, ; 220: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 66
	i64 18324163916253801303, ; 221: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 14
	i64 18342408478508122430, ; 222: id\Microsoft.Maui.Controls.resources.dll => 0xfe8d53543697013e => 13
	i64 18358161419737137786 ; 223: he\Microsoft.Maui.Controls.resources.dll => 0xfec54a8ba8b6827a => 9
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [224 x i32] [
	i32 42, ; 0
	i32 111, ; 1
	i32 46, ; 2
	i32 87, ; 3
	i32 52, ; 4
	i32 69, ; 5
	i32 104, ; 6
	i32 82, ; 7
	i32 12, ; 8
	i32 57, ; 9
	i32 73, ; 10
	i32 65, ; 11
	i32 91, ; 12
	i32 43, ; 13
	i32 110, ; 14
	i32 104, ; 15
	i32 50, ; 16
	i32 62, ; 17
	i32 89, ; 18
	i32 95, ; 19
	i32 49, ; 20
	i32 6, ; 21
	i32 69, ; 22
	i32 28, ; 23
	i32 44, ; 24
	i32 61, ; 25
	i32 57, ; 26
	i32 77, ; 27
	i32 60, ; 28
	i32 101, ; 29
	i32 53, ; 30
	i32 99, ; 31
	i32 48, ; 32
	i32 27, ; 33
	i32 37, ; 34
	i32 2, ; 35
	i32 7, ; 36
	i32 73, ; 37
	i32 59, ; 38
	i32 93, ; 39
	i32 75, ; 40
	i32 46, ; 41
	i32 35, ; 42
	i32 70, ; 43
	i32 108, ; 44
	i32 22, ; 45
	i32 99, ; 46
	i32 36, ; 47
	i32 106, ; 48
	i32 35, ; 49
	i32 68, ; 50
	i32 39, ; 51
	i32 44, ; 52
	i32 92, ; 53
	i32 89, ; 54
	i32 3, ; 55
	i32 96, ; 56
	i32 33, ; 57
	i32 82, ; 58
	i32 87, ; 59
	i32 81, ; 60
	i32 28, ; 61
	i32 48, ; 62
	i32 70, ; 63
	i32 98, ; 64
	i32 18, ; 65
	i32 26, ; 66
	i32 76, ; 67
	i32 98, ; 68
	i32 26, ; 69
	i32 29, ; 70
	i32 85, ; 71
	i32 100, ; 72
	i32 72, ; 73
	i32 23, ; 74
	i32 102, ; 75
	i32 6, ; 76
	i32 34, ; 77
	i32 60, ; 78
	i32 7, ; 79
	i32 11, ; 80
	i32 56, ; 81
	i32 41, ; 82
	i32 19, ; 83
	i32 93, ; 84
	i32 88, ; 85
	i32 81, ; 86
	i32 94, ; 87
	i32 90, ; 88
	i32 108, ; 89
	i32 74, ; 90
	i32 14, ; 91
	i32 50, ; 92
	i32 25, ; 93
	i32 79, ; 94
	i32 59, ; 95
	i32 84, ; 96
	i32 16, ; 97
	i32 109, ; 98
	i32 79, ; 99
	i32 47, ; 100
	i32 100, ; 101
	i32 31, ; 102
	i32 67, ; 103
	i32 95, ; 104
	i32 109, ; 105
	i32 66, ; 106
	i32 21, ; 107
	i32 84, ; 108
	i32 31, ; 109
	i32 72, ; 110
	i32 49, ; 111
	i32 5, ; 112
	i32 29, ; 113
	i32 103, ; 114
	i32 53, ; 115
	i32 78, ; 116
	i32 1, ; 117
	i32 111, ; 118
	i32 45, ; 119
	i32 90, ; 120
	i32 96, ; 121
	i32 43, ; 122
	i32 3, ; 123
	i32 19, ; 124
	i32 56, ; 125
	i32 75, ; 126
	i32 54, ; 127
	i32 1, ; 128
	i32 33, ; 129
	i32 91, ; 130
	i32 76, ; 131
	i32 40, ; 132
	i32 45, ; 133
	i32 12, ; 134
	i32 27, ; 135
	i32 8, ; 136
	i32 71, ; 137
	i32 15, ; 138
	i32 41, ; 139
	i32 55, ; 140
	i32 97, ; 141
	i32 13, ; 142
	i32 71, ; 143
	i32 39, ; 144
	i32 30, ; 145
	i32 102, ; 146
	i32 58, ; 147
	i32 63, ; 148
	i32 34, ; 149
	i32 51, ; 150
	i32 86, ; 151
	i32 52, ; 152
	i32 42, ; 153
	i32 0, ; 154
	i32 21, ; 155
	i32 110, ; 156
	i32 9, ; 157
	i32 74, ; 158
	i32 30, ; 159
	i32 68, ; 160
	i32 80, ; 161
	i32 83, ; 162
	i32 58, ; 163
	i32 51, ; 164
	i32 105, ; 165
	i32 23, ; 166
	i32 92, ; 167
	i32 24, ; 168
	i32 32, ; 169
	i32 101, ; 170
	i32 2, ; 171
	i32 37, ; 172
	i32 16, ; 173
	i32 15, ; 174
	i32 32, ; 175
	i32 55, ; 176
	i32 0, ; 177
	i32 38, ; 178
	i32 86, ; 179
	i32 94, ; 180
	i32 17, ; 181
	i32 85, ; 182
	i32 88, ; 183
	i32 22, ; 184
	i32 36, ; 185
	i32 54, ; 186
	i32 38, ; 187
	i32 83, ; 188
	i32 4, ; 189
	i32 62, ; 190
	i32 107, ; 191
	i32 106, ; 192
	i32 5, ; 193
	i32 24, ; 194
	i32 107, ; 195
	i32 18, ; 196
	i32 40, ; 197
	i32 47, ; 198
	i32 67, ; 199
	i32 17, ; 200
	i32 103, ; 201
	i32 25, ; 202
	i32 65, ; 203
	i32 78, ; 204
	i32 64, ; 205
	i32 80, ; 206
	i32 20, ; 207
	i32 10, ; 208
	i32 10, ; 209
	i32 8, ; 210
	i32 20, ; 211
	i32 63, ; 212
	i32 61, ; 213
	i32 97, ; 214
	i32 11, ; 215
	i32 4, ; 216
	i32 105, ; 217
	i32 64, ; 218
	i32 77, ; 219
	i32 66, ; 220
	i32 14, ; 221
	i32 13, ; 222
	i32 9 ; 223
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

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
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ af27162bee43b7fecdca59b4f67aa8c175cbc875"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}