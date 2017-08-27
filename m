From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102430] New: nv4x - memory problems when starting
 graphical application - logs included
Date: Sun, 27 Aug 2017 13:59:37 +0000
Message-ID: <bug-102430-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1724469752=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1724469752==
Content-Type: multipart/alternative; boundary="15038423770.E5C9bB7.1057";
 charset="UTF-8"


--15038423770.E5C9bB7.1057
Date: Sun, 27 Aug 2017 13:59:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102430

            Bug ID: 102430
           Summary: nv4x - memory problems when starting graphical
                    application - logs included
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: caguduzexi-ybJNiJ/GDrisTnJN9+BGXg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

When i start for example supertuxkart on a nv42 card, i get those errors:

[  114.511256] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 0400028
[  114.528921] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 03000248
[  114.546540] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 04000248
[  114.564160] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 03000248
[  115.000790] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 02000248
[  115.415427] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 02000248
[  117.220299] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 02000248
[  118.922242] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 04000248
[  118.939894] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 03000248
[  121.001922] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 04000248
[  121.019557] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 03000248
[  121.037178] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 04000248
[  121.054793] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 03000248
[  121.072409] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 04000248
[  121.090027] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 03000248
[  121.597086] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 02000248
[  121.769931] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 020




[  124.918095] [TTM] Failed to find memory space for buffer 0xffff97a0c738d=
c00
eviction
[  124.925842] [TTM] No space for ffff97a0c738dc00 (1366 pages, 5464K, 5M)
[  124.932458] [TTM]   placement[0]=3D0x00070002 (1)
[  124.936978] [TTM]     has_type: 1
[  124.940283] [TTM]     use_type: 1
[  124.943590] [TTM]     flags: 0x0000000A
[  124.947423] [TTM]     gpu_offset: 0x00000000
[  124.951679] [TTM]     size: 131072
[  124.955074] [TTM]     available_caching: 0x00070000
[  124.959940] [TTM]     default_caching: 0x00010000
[  124.967291] [TTM] Failed to find memory space for buffer 0xffff97a0c738d=
000
eviction
[  124.975042] [TTM] No space for ffff97a0c738d000 (1366 pages, 5464K, 5M)
[  124.981657] [TTM]   placement[0]=3D0x00070002 (1)
[  124.986176] [TTM]     has_type: 1
[  124.989482] [TTM]     use_type: 1
[  124.992787] [TTM]     flags: 0x0000000A
[  124.996611] [TTM]     gpu_offset: 0x00000000
[  125.000876] [TTM]     size: 131072
[  125.004268] [TTM]     available_caching: 0x00070000
[  125.009134] [TTM]     default_caching: 0x00010000
[  125.373168] [TTM] Failed to find memory space for buffer 0xffff97a0bca01=
c00
eviction
[  125.380959] [TTM] No space for ffff97a0bca01c00 (1366 pages, 5464K, 5M)
[  125.387562] [TTM]   placement[0]=3D0x00070002 (1)
[  125.392081] [TTM]     has_type: 1
[  125.395388] [TTM]     use_type: 1
[  125.398701] [TTM]     flags: 0x0000000A
[  125.402526] [TTM]     gpu_offset: 0x00000000
[  125.406784] [TTM]     size: 131072
[  125.410177] [TTM]     available_caching: 0x00070000
[  125.415051] [TTM]     default_caching: 0x00010000
[  125.422678] [TTM] Failed to find memory space for buffer 0xffff97a0bbf15=
000
eviction
[  125.430415] [TTM] No space for ffff97a0bbf15000 (1366 pages, 5464K, 5M)
[  125.437032] [TTM]   placement[0]=3D0x00070002 (1)
[  125.441557] [TTM]     has_type: 1
[  125.444860] [TTM]     use_type: 1
[  125.448173] [TTM]     flags: 0x0000000A
[  125.451999] [TTM]     gpu_offset: 0x00000000
[  125.456257] [TTM]     size: 131072
[  125.459649] [TTM]     available_caching: 0x00070000
[  125.464521] [TTM]     default_caching: 0x00010000
[  125.533498] [TTM] Failed to find memory space for buffer 0xffff97a0cfae3=
800
eviction
[  125.541280] [TTM] No space for ffff97a0cfae3800 (1366 pages, 5464K, 5M)
[  125.547897] [TTM]   placement[0]=3D0x00070002 (1)
[  125.552417] [TTM]     has_type: 1
[  125.555722] [TTM]     use_type: 1
[  125.559028] [TTM]     flags: 0x0000000A
[  125.562854] [TTM]     gpu_offset: 0x00000000
[  125.567122] [TTM]     size: 131072
[  125.570517] [TTM]     available_caching: 0x00070000
[  125.575383] [TTM]     default_caching: 0x00010000
[  125.581168] [TTM] Failed to find memory space for buffer 0xffff97a0cf90b=
000
eviction
[  125.588904] [TTM] No space for ffff97a0cf90b000 (1366 pages, 5464K, 5M)
[  125.595504] [TTM]   placement[0]=3D0x00070002 (1)
[  125.600034] [TTM]     has_type: 1
[  125.603341] [TTM]     use_type: 1
[  125.606645] [TTM]     flags: 0x0000000A
[  125.610474] [TTM]     gpu_offset: 0x00000000
[  125.614739] [TTM]     size: 131072
[  125.618129] [TTM]     available_caching: 0x00070000
[  125.622996] [TTM]     default_caching: 0x00010000
[  125.843046] [TTM] Failed to find memory space for buffer 0xffff97a0cf963=
400
eviction
[  125.850847] [TTM] No space for ffff97a0cf963400 (1366 pages, 5464K, 5M)
[  125.857455] [TTM]   placement[0]=3D0x00070002 (1)
[  125.861972] [TTM]     has_type: 1
[  125.865285] [TTM]     use_type: 1
[  125.868588] [TTM]     flags: 0x0000000A
[  125.872416] [TTM]     gpu_offset: 0x00000000
[  125.876674] [TTM]     size: 131072
[  125.880069] [TTM]     available_caching: 0x00070000
[  125.884940] [TTM]     default_caching: 0x00010000
[  125.891579] [TTM] Failed to find memory space for buffer 0xffff97a0c25c8=
800
eviction
[  125.899368] [TTM] No space for ffff97a0c25c8800 (1366 pages, 5464K, 5M)
[  125.905971] [TTM]   placement[0]=3D0x00070002 (1)
[  125.910493] [TTM]     has_type: 1
[  125.913798] [TTM]     use_type: 1
[  125.917111] [TTM]     flags: 0x0000000A
[  125.920935] [TTM]     gpu_offset: 0x00000000
[  125.925193] [TTM]     size: 131072
[  125.928585] [TTM]     available_caching: 0x00070000
[  125.933455] [TTM]     default_caching: 0x00010000
[  126.162405] [TTM] Failed to find memory space for buffer 0xffff97a0f2c4d=
c00
eviction
[  126.170158] [TTM] No space for ffff97a0f2c4dc00 (1366 pages, 5464K, 5M)
[  126.176766] [TTM]   placement[0]=3D0x00070002 (1)
[  126.181294] [TTM]     has_type: 1
[  126.184602] [TTM]     use_type: 1
[  126.187908] [TTM]     flags: 0x0000000A
[  126.191736] [TTM]     gpu_offset: 0x00000000
[  126.195994] [TTM]     size: 131072
[  126.199393] [TTM]     available_caching: 0x00070000
[  126.204257] [TTM]     default_caching: 0x00010000
[  126.210542] [TTM] Failed to find memory space for buffer 0xffff97a0c45a1=
800
eviction
[  126.218324] [TTM] No space for ffff97a0c45a1800 (1366 pages, 5464K, 5M)
[  126.224927] [TTM]   placement[0]=3D0x00070002 (1)
[  126.229447] [TTM]     has_type: 1
[  126.232758] [TTM]     use_type: 1
[  126.236065] [TTM]     flags: 0x0000000A
[  126.239890] [TTM]     gpu_offset: 0x00000000
[  126.244150] [TTM]     size: 131072
[  126.247549] [TTM]     available_caching: 0x00070000
[  126.252413] [TTM]     default_caching: 0x00010000
[  126.409003] [TTM] Failed to find memory space for buffer 0xffff97a0c738d=
400
eviction
[  126.416791] [TTM] No space for ffff97a0c738d400 (1366 pages, 5464K, 5M)
[  126.423398] [TTM]   placement[0]=3D0x00070002 (1)
[  126.427918] [TTM]     has_type: 1
[  126.431230] [TTM]     use_type: 1
[  126.434534] [TTM]     flags: 0x0000000A
[  126.438361] [TTM]     gpu_offset: 0x00000000
[  126.442620] [TTM]     size: 131072
[  126.446012] [TTM]     available_caching: 0x00070000
[  126.450884] [TTM]     default_caching: 0x00010000
[  126.458674] [TTM] Failed to find memory space for buffer 0xffff97a0bca01=
400
eviction
[  126.466453] [TTM] No space for ffff97a0bca01400 (342 pages, 1368K, 1M)
[  126.472969] [TTM]   placement[0]=3D0x00070002 (1)
[  126.477489] [TTM]     has_type: 1
[  126.480800] [TTM]     use_type: 1
[  126.484106] [TTM]     flags: 0x0000000A
[  126.487932] [TTM]     gpu_offset: 0x00000000
[  126.492191] [TTM]     size: 131072
[  126.495585] [TTM]     available_caching: 0x00070000
[  126.500458] [TTM]     default_caching: 0x00010000
[  126.677600] [TTM] Failed to find memory space for buffer 0xffff97a0b5057=
c00
eviction
[  126.685367] [TTM] No space for ffff97a0b5057c00 (342 pages, 1368K, 1M)
[  126.691887] [TTM]   placement[0]=3D0x00070002 (1)
[  126.696408] [TTM]     has_type: 1
[  126.699721] [TTM]     use_type: 1
[  126.703028] [TTM]     flags: 0x0000000A
[  126.706854] [TTM]     gpu_offset: 0x00000000
[  126.711115] [TTM]     size: 131072
[  126.714514] [TTM]     available_caching: 0x00070000
[  126.719377] [TTM]     default_caching: 0x00010000
[  126.727380] [TTM] Failed to find memory space for buffer 0xffff97a0cf963=
000
eviction
[  126.735127] [TTM] No space for ffff97a0cf963000 (342 pages, 1368K, 1M)
[  126.741640] [TTM]   placement[0]=3D0x00070002 (1)
[  126.746159] [TTM]     has_type: 1
[  126.749469] [TTM]     use_type: 1
[  126.752772] [TTM]     flags: 0x0000000A
[  126.756595] [TTM]     gpu_offset: 0x00000000
[  126.760856] [TTM]     size: 131072
[  126.764254] [TTM]     available_caching: 0x00070000
[  126.769120] [TTM]     default_caching: 0x00010000
[  126.827478] [TTM] Failed to find memory space for buffer 0xffff97a0bdf22=
800
eviction
[  126.835250] [TTM] No space for ffff97a0bdf22800 (342 pages, 1368K, 1M)
[  126.841773] [TTM]   placement[0]=3D0x00070002 (1)
[  126.846297] [TTM]     has_type: 1
[  126.849612] [TTM]     use_type: 1
[  126.852919] [TTM]     flags: 0x0000000A
[  126.856745] [TTM]     gpu_offset: 0x00000000
[  126.861005] [TTM]     size: 131072
[  126.864402] [TTM]     available_caching: 0x00070000
[  126.869269] [TTM]     default_caching: 0x00010000
[  126.875645] [TTM] Failed to find memory space for buffer 0xffff97a0c1bdc=
400
eviction
[  126.883403] [TTM] No space for ffff97a0c1bdc400 (342 pages, 1368K, 1M)
[  126.889922] [TTM]   placement[0]=3D0x00070002 (1)
[  126.894442] [TTM]     has_type: 1
[  126.897754] [TTM]     use_type: 1
[  126.901061] [TTM]     flags: 0x0000000A
[  126.904887] [TTM]     gpu_offset: 0x00000000
[  126.909146] [TTM]     size: 131072
[  126.912539] [TTM]     available_caching: 0x00070000
[  126.917416] [TTM]     default_caching: 0x00010000
[  127.279695] [TTM] Failed to find memory space for buffer 0xffff97a0c1bdc=
c00
eviction
[  127.287496] [TTM] No space for ffff97a0c1bdcc00 (1366 pages, 5464K, 5M)
[  127.294098] [TTM]   placement[0]=3D0x00070002 (1)
[  127.298627] [TTM]     has_type: 1
[  127.301932] [TTM]     use_type: 1
[  127.305239] [TTM]     flags: 0x0000000A
[  127.309064] [TTM]     gpu_offset: 0x00000000
[  127.313325] [TTM]     size: 131072
[  127.316723] [TTM]     available_caching: 0x00070000
[  127.321587] [TTM]     default_caching: 0x00010000
[  127.327900] [TTM] Failed to find memory space for buffer 0xffff97a0b8a6c=
800
eviction
[  127.335683] [TTM] No space for ffff97a0b8a6c800 (1366 pages, 5464K, 5M)
[  127.342287] [TTM]   placement[0]=3D0x00070002 (1)
[  127.346807] [TTM]     has_type: 1
[  127.350120] [TTM]     use_type: 1
[  127.353427] [TTM]     flags: 0x0000000A
[  127.357255] [TTM]     gpu_offset: 0x00000000
[  127.361514] [TTM]     size: 131072
[  127.364913] [TTM]     available_caching: 0x00070000
[  127.369777] [TTM]     default_caching: 0x00010000
[  127.663989] [TTM] Failed to find memory space for buffer 0xffff97a0cb1da=
c00
eviction
[  127.671799] [TTM] No space for ffff97a0cb1dac00 (683 pages, 2732K, 2M)
[  127.678324] [TTM]   placement[0]=3D0x00070002 (1)
[  127.682854] [TTM]     has_type: 1
[  127.686161] [TTM]     use_type: 1
[  127.689470] [TTM]     flags: 0x0000000A
[  127.693298] [TTM]     gpu_offset: 0x00000000
[  127.697568] [TTM]     size: 131072
[  127.700963] [TTM]     available_caching: 0x00070000
[  127.705828] [TTM]     default_caching: 0x00010000
[  127.757232] [TTM] Failed to find memory space for buffer 0xffff97a0b5e6d=
800
eviction
[  127.765015] [TTM] No space for ffff97a0b5e6d800 (342 pages, 1368K, 1M)
[  127.771533] [TTM]   placement[0]=3D0x00070002 (1)
[  127.776053] [TTM]     has_type: 1
[  127.779363] [TTM]     use_type: 1
[  127.782676] [TTM]     flags: 0x0000000A
[  127.786504] [TTM]     gpu_offset: 0x00000000
[  127.790762] [TTM]     size: 131072
[  127.794155] [TTM]     available_caching: 0x00070000
[  127.799027] [TTM]     default_caching: 0x00010000
[  127.808052] [TTM] Failed to find memory space for buffer 0xffff97a0b5e6d=
c00
eviction
[  127.815801] [TTM] No space for ffff97a0b5e6dc00 (342 pages, 1368K, 1M)
[  127.822317] [TTM]   placement[0]=3D0x00070002 (1)
[  127.826837] [TTM]     has_type: 1
[  127.830144] [TTM]     use_type: 1
[  127.833456] [TTM]     flags: 0x0000000A
[  127.837279] [TTM]     gpu_offset: 0x00000000
[  127.841539] [TTM]     size: 131072
[  127.844933] [TTM]     available_caching: 0x00070000
[  127.849804] [TTM]     default_caching: 0x00010000
[  127.946757] [TTM] Failed to find memory space for buffer 0xffff97a0b3d7e=
c00
eviction
[  127.954519] [TTM] No space for ffff97a0b3d7ec00 (342 pages, 1368K, 1M)
[  127.961044] [TTM]   placement[0]=3D0x00070002 (1)
[  127.965573] [TTM]     has_type: 1
[  127.968880] [TTM]     use_type: 1
[  127.972185] [TTM]     flags: 0x0000000A
[  127.976013] [TTM]     gpu_offset: 0x00000000
[  127.980273] [TTM]     size: 131072
[  127.983671] [TTM]     available_caching: 0x00070000
[  127.988536] [TTM]     default_caching: 0x00010000
[  127.995874] [TTM] Failed to find memory space for buffer 0xffff97a11fcf9=
800
eviction
[  128.003624] [TTM] No space for ffff97a11fcf9800 (342 pages, 1368K, 1M)
[  128.010140] [TTM]   placement[0]=3D0x00070002 (1)
[  128.014666] [TTM]     has_type: 1
[  128.017970] [TTM]     use_type: 1
[  128.021276] [TTM]     flags: 0x0000000A
[  128.025104] [TTM]     gpu_offset: 0x00000000
[  128.029362] [TTM]     size: 131072
[  128.032760] [TTM]     available_caching: 0x00070000
[  128.037632] [TTM]     default_caching: 0x00010000
[  128.276341] [TTM] Failed to find memory space for buffer 0xffff97a11fcf8=
400
eviction
[  128.284146] [TTM] No space for ffff97a11fcf8400 (342 pages, 1368K, 1M)
[  128.290670] [TTM]   placement[0]=3D0x00070002 (1)
[  128.295190] [TTM]     has_type: 1
[  128.298501] [TTM]     use_type: 1
[  128.301805] [TTM]     flags: 0x0000000A
[  128.305632] [TTM]     gpu_offset: 0x00000000
[  128.309891] [TTM]     size: 131072
[  128.313286] [TTM]     available_caching: 0x00070000
[  128.318158] [TTM]     default_caching: 0x00010000
[  128.375260] [TTM] Failed to find memory space for buffer 0xffff97a0ba6d5=
c00
eviction
[  128.383029] [TTM] No space for ffff97a0ba6d5c00 (342 pages, 1368K, 1M)
[  128.389546] [TTM]   placement[0]=3D0x00070002 (1)
[  128.394064] [TTM]     has_type: 1
[  128.397370] [TTM]     use_type: 1
[  128.400682] [TTM]     flags: 0x0000000A
[  128.404508] [TTM]     gpu_offset: 0x00000000
[  128.408767] [TTM]     size: 131072
[  128.412159] [TTM]     available_caching: 0x00070000
[  128.417031] [TTM]     default_caching: 0x00010000
[  128.424904] [TTM] Failed to find memory space for buffer 0xffff97a0b9974=
400
eviction
[  128.432652] [TTM] No space for ffff97a0b9974400 (342 pages, 1368K, 1M)
[  128.439166] [TTM]   placement[0]=3D0x00070002 (1)
[  128.443683] [TTM]     has_type: 1
[  128.446989] [TTM]     use_type: 1
[  128.450302] [TTM]     flags: 0x0000000A
[  128.454127] [TTM]     gpu_offset: 0x00000000
[  128.458386] [TTM]     size: 131072
[  128.461779] [TTM]     available_caching: 0x00070000
[  128.466651] [TTM]     default_caching: 0x00010000
[  128.587891] [TTM] Failed to find memory space for buffer 0xffff97a0b50e2=
000
eviction
[  128.595669] [TTM] No space for ffff97a0b50e2000 (342 pages, 1368K, 1M)
[  128.602202] [TTM]   placement[0]=3D0x00070002 (1)
[  128.606722] [TTM]     has_type: 1
[  128.610034] [TTM]     use_type: 1
[  128.613338] [TTM]     flags: 0x0000000A
[  128.617171] [TTM]     gpu_offset: 0x00000000
[  128.621428] [TTM]     size: 131072
[  128.624824] [TTM]     available_caching: 0x00070000
[  128.629687] [TTM]     default_caching: 0x00010000
[  128.638099] [TTM] Failed to find memory space for buffer 0xffff97a0b3d7e=
000
eviction
[  128.645866] [TTM] No space for ffff97a0b3d7e000 (342 pages, 1368K, 1M)
[  128.652397] [TTM]   placement[0]=3D0x00070002 (1)
[  128.656917] [TTM]     has_type: 1
[  128.660223] [TTM]     use_type: 1
[  128.663529] [TTM]     flags: 0x0000000A
[  128.667363] [TTM]     gpu_offset: 0x00000000
[  128.671621] [TTM]     size: 131072
[  128.675013] [TTM]     available_caching: 0x00070000
[  128.679879] [TTM]     default_caching: 0x00010000
[  128.905310] [TTM] Failed to find memory space for buffer 0xffff97a11fd0c=
000
eviction
[  128.913085] [TTM] No space for ffff97a11fd0c000 (342 pages, 1368K, 1M)
[  128.919644] [TTM]   placement[0]=3D0x00070002 (1)
[  128.924176] [TTM]     has_type: 1
[  128.927487] [TTM]     use_type: 1
[  128.930809] [TTM]     flags: 0x0000000A
[  128.934643] [TTM]     gpu_offset: 0x00000000
[  128.938910] [TTM]     size: 131072
[  128.942306] [TTM]     available_caching: 0x00070000
[  128.947177] [TTM]     default_caching: 0x00010000
[  128.956869] [TTM] Failed to find memory space for buffer 0xffff97a0b3d6d=
400
eviction
[  128.964653] [TTM] No space for ffff97a0b3d6d400 (342 pages, 1368K, 1M)
[  128.971169] [TTM]   placement[0]=3D0x00070002 (1)
[  128.975693] [TTM]     has_type: 1
[  128.978997] [TTM]     use_type: 1
[  128.982310] [TTM]     flags: 0x0000000A
[  128.986133] [TTM]     gpu_offset: 0x00000000
[  128.990392] [TTM]     size: 131072
[  128.993787] [TTM]     available_caching: 0x00070000
[  128.998660] [TTM]     default_caching: 0x00010000
[  129.079184] [TTM] Failed to find memory space for buffer 0xffff97a0b7ad3=
000
eviction
[  129.086992] [TTM] No space for ffff97a0b7ad3000 (342 pages, 1368K, 1M)
[  129.093517] [TTM]   placement[0]=3D0x00070002 (1)
[  129.098045] [TTM]     has_type: 1
[  129.101351] [TTM]     use_type: 1
[  129.104656] [TTM]     flags: 0x0000000A
[  129.108484] [TTM]     gpu_offset: 0x00000000
[  129.112744] [TTM]     size: 131072
[  129.116146] [TTM]     available_caching: 0x00070000
[  129.121015] [TTM]     default_caching: 0x00010000
[  129.275685] [TTM] Failed to find memory space for buffer 0xffff97a0b5bb9=
000
eviction
[  129.283454] [TTM] No space for ffff97a0b5bb9000 (342 pages, 1368K, 1M)
[  129.289973] [TTM]   placement[0]=3D0x00070002 (1)
[  129.294496] [TTM]     has_type: 1
[  129.297809] [TTM]     use_type: 1
[  129.301116] [TTM]     flags: 0x0000000A
[  129.304942] [TTM]     gpu_offset: 0x00000000
[  129.309203] [TTM]     size: 131072
[  129.312592] [TTM]     available_caching: 0x00070000
[  129.317464] [TTM]     default_caching: 0x00010000
[  129.322161] nouveau 0000:08:00.0: supertuxkart[1074]: fail ttm_validate
[  129.328763] nouveau 0000:08:00.0: supertuxkart[1074]: validating bo list
[  129.335460] nouveau 0000:08:00.0: supertuxkart[1074]: validate: -12
[  129.385472] [TTM] Failed to find memory space for buffer 0xffff97a0b3dd7=
000
eviction
[  129.393239] [TTM] No space for ffff97a0b3dd7000 (342 pages, 1368K, 1M)
[  129.399777] [TTM]   placement[0]=3D0x00070002 (1)
[  129.404294] [TTM]     has_type: 1
[  129.407601] [TTM]     use_type: 1
[  129.410905] [TTM]     flags: 0x0000000A
[  129.414740] [TTM]     gpu_offset: 0x00000000
[  129.419002] [TTM]     size: 131072
[  129.422395] [TTM]     available_caching: 0x00070000
[  129.427260] [TTM]     default_caching: 0x00010000
[  129.431963] nouveau 0000:08:00.0: supertuxkart[1074]: fail ttm_validate
[  129.438563] nouveau 0000:08:00.0: supertuxkart[1074]: validating bo list
[  129.445252] nouveau 0000:08:00.0: supertuxkart[1074]: validate: -12
[  129.491823] [TTM] Failed to find memory space for buffer 0xffff97a0b9974=
000
eviction
[  129.499574] [TTM] No space for ffff97a0b9974000 (342 pages, 1368K, 1M)
[  129.506090] [TTM]   placement[0]=3D0x00070002 (1)
[  129.510611] [TTM]     has_type: 1
[  129.513915] [TTM]     use_type: 1
[  129.517229] [TTM]     flags: 0x0000000A
[  129.521057] [TTM]     gpu_offset: 0x00000000
[  129.525317] [TTM]     size: 131072
[  129.528708] [TTM]     available_caching: 0x00070000
[  129.533583] [TTM]     default_caching: 0x00010000
[  129.538280] nouveau 0000:08:00.0: supertuxkart[1074]: fail ttm_validate
[  129.544882] nouveau 0000:08:00.0: supertuxkart[1074]: validating bo list
[  129.551577] nouveau 0000:08:00.0: supertuxkart[1074]: validate: -12
[  155.869283] [TTM] Failed to find memory space for buffer 0xffff97a0b3c80=
c00
eviction
[  155.877087] [TTM] No space for ffff97a0b3c80c00 (1366 pages, 5464K, 5M)
[  155.883714] [TTM]   placement[0]=3D0x00070002 (1)
[  155.888246] [TTM]     has_type: 1
[  155.891549] [TTM]     use_type: 1
[  155.894854] [TTM]     flags: 0x0000000A
[  155.898699] [TTM]     gpu_offset: 0x00000000
[  155.902961] [TTM]     size: 131072
[  155.906370] [TTM]     available_caching: 0x00070000
[  155.911249] [TTM]     default_caching: 0x00010000
[  155.915953] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  155.922132] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  155.928400] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  155.954315] [TTM] Failed to find memory space for buffer 0xffff97a0b3d6d=
c00
eviction
[  155.962090] [TTM] No space for ffff97a0b3d6dc00 (342 pages, 1368K, 1M)
[  155.968643] [TTM]   placement[0]=3D0x00070002 (1)
[  155.973164] [TTM]     has_type: 1
[  155.976482] [TTM]     use_type: 1
[  155.979787] [TTM]     flags: 0x0000000A
[  155.983635] [TTM]     gpu_offset: 0x00000000
[  155.987896] [TTM]     size: 131072
[  155.991301] [TTM]     available_caching: 0x00070000
[  155.996168] [TTM]     default_caching: 0x00010000
[  156.000884] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  156.007050] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  156.013305] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  156.040417] [TTM] Failed to find memory space for buffer 0xffff97a0b5bb9=
800
eviction
[  156.048178] [TTM] No space for ffff97a0b5bb9800 (1366 pages, 5464K, 5M)
[  156.054785] [TTM]   placement[0]=3D0x00070002 (1)
[  156.059304] [TTM]     has_type: 1
[  156.062608] [TTM]     use_type: 1
[  156.065922] [TTM]     flags: 0x0000000A
[  156.069746] [TTM]     gpu_offset: 0x00000000
[  156.074005] [TTM]     size: 131072
[  156.077398] [TTM]     available_caching: 0x00070000
[  156.082270] [TTM]     default_caching: 0x00010000
[  156.086964] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  156.093130] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  156.099391] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  156.124483] [TTM] Failed to find memory space for buffer 0xffff97a0b5afc=
000
eviction
[  156.132241] [TTM] No space for ffff97a0b5afc000 (1366 pages, 5464K, 5M)
[  156.138844] [TTM]   placement[0]=3D0x00070002 (1)
[  156.143365] [TTM]     has_type: 1
[  156.146669] [TTM]     use_type: 1
[  156.149982] [TTM]     flags: 0x0000000A
[  156.153811] [TTM]     gpu_offset: 0x00000000
[  156.158070] [TTM]     size: 131072
[  156.161462] [TTM]     available_caching: 0x00070000
[  156.166336] [TTM]     default_caching: 0x00010000
[  156.171028] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  156.177193] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  156.183454] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  156.303792] [TTM] Failed to find memory space for buffer 0xffff97a0b6409=
c00
eviction
[  156.311536] [TTM] No space for ffff97a0b6409c00 (342 pages, 1368K, 1M)
[  156.318077] [TTM]   placement[0]=3D0x00070002 (1)
[  156.322600] [TTM]     has_type: 1
[  156.325904] [TTM]     use_type: 1
[  156.329210] [TTM]     flags: 0x0000000A
[  156.333042] [TTM]     gpu_offset: 0x00000000
[  156.337301] [TTM]     size: 131072
[  156.340693] [TTM]     available_caching: 0x00070000
[  156.345562] [TTM]     default_caching: 0x00010000
[  156.350263] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  156.356429] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  156.362716] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  156.372060] [TTM] Failed to find memory space for buffer 0xffff97a0b6409=
000
eviction
[  156.379810] [TTM] No space for ffff97a0b6409000 (342 pages, 1368K, 1M)
[  156.386347] [TTM]   placement[0]=3D0x00070002 (1)
[  156.390869] [TTM]     has_type: 1
[  156.394205] [TTM]     use_type: 1
[  156.397519] [TTM]     flags: 0x0000000A
[  156.401345] [TTM]     gpu_offset: 0x00000000
[  156.405607] [TTM]     size: 131072
[  156.409013] [TTM]     available_caching: 0x00070000
[  156.413878] [TTM]     default_caching: 0x00010000
[  156.418579] nouveau 0000:08:00.0: plasmashell[882]: fail ttm_validate
[  156.425005] nouveau 0000:08:00.0: plasmashell[882]: validating bo list
[  156.431532] nouveau 0000:08:00.0: plasmashell[882]: validate: -12
[  156.458218] [TTM] Failed to find memory space for buffer 0xffff97a0bc99d=
000
eviction
[  156.465982] [TTM] No space for ffff97a0bc99d000 (342 pages, 1368K, 1M)
[  156.472497] [TTM]   placement[0]=3D0x00070002 (1)
[  156.477018] [TTM]     has_type: 1
[  156.480322] [TTM]     use_type: 1
[  156.483635] [TTM]     flags: 0x0000000A
[  156.487461] [TTM]     gpu_offset: 0x00000000
[  156.491719] [TTM]     size: 131072
[  156.495111] [TTM]     available_caching: 0x00070000
[  156.499984] [TTM]     default_caching: 0x00010000
[  156.504678] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  156.510847] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  156.517109] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  156.553730] [TTM] Failed to find memory space for buffer 0xffff97a0b3c3d=
400
eviction
[  156.561476] [TTM] No space for ffff97a0b3c3d400 (342 pages, 1368K, 1M)
[  156.568010] [TTM]   placement[0]=3D0x00070002 (1)
[  156.572530] [TTM]     has_type: 1
[  156.575834] [TTM]     use_type: 1
[  156.579143] [TTM]     flags: 0x0000000A
[  156.582974] [TTM]     gpu_offset: 0x00000000
[  156.587233] [TTM]     size: 131072
[  156.590626] [TTM]     available_caching: 0x00070000
[  156.595492] [TTM]     default_caching: 0x00010000
[  156.600193] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  156.606359] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  156.612615] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  156.639185] [TTM] Failed to find memory space for buffer 0xffff97a0af072=
800
eviction
[  156.646963] [TTM] No space for ffff97a0af072800 (342 pages, 1368K, 1M)
[  156.653498] [TTM]   placement[0]=3D0x00070002 (1)
[  156.658016] [TTM]     has_type: 1
[  156.661322] [TTM]     use_type: 1
[  156.664635] [TTM]     flags: 0x0000000A
[  156.668464] [TTM]     gpu_offset: 0x00000000
[  156.672723] [TTM]     size: 131072
[  156.676114] [TTM]     available_caching: 0x00070000
[  156.680988] [TTM]     default_caching: 0x00010000
[  156.685681] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  156.691849] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  156.698144] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  156.839229] [TTM] Failed to find memory space for buffer 0xffff97a0b5876=
000
eviction
[  156.847002] [TTM] No space for ffff97a0b5876000 (342 pages, 1368K, 1M)
[  156.853544] [TTM]   placement[0]=3D0x00070002 (1)
[  156.858081] [TTM]     has_type: 1
[  156.861390] [TTM]     use_type: 1
[  156.864719] [TTM]     flags: 0x0000000A
[  156.868547] [TTM]     gpu_offset: 0x00000000
[  156.872823] [TTM]     size: 131072
[  156.876216] [TTM]     available_caching: 0x00070000
[  156.881103] [TTM]     default_caching: 0x00010000
[  156.885801] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  156.891983] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  156.898267] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  156.928358] [TTM] Failed to find memory space for buffer 0xffff97a0b5afc=
400
eviction
[  156.936149] [TTM] No space for ffff97a0b5afc400 (1366 pages, 5464K, 5M)
[  156.942757] [TTM]   placement[0]=3D0x00070002 (1)
[  156.947276] [TTM]     has_type: 1
[  156.950588] [TTM]     use_type: 1
[  156.953892] [TTM]     flags: 0x0000000A
[  156.957717] [TTM]     gpu_offset: 0x00000000
[  156.961977] [TTM]     size: 131072
[  156.965376] [TTM]     available_caching: 0x00070000
[  156.970241] [TTM]     default_caching: 0x00010000
[  156.974937] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  156.981111] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  156.987364] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  157.011900] [TTM] Failed to find memory space for buffer 0xffff97a0b644a=
400
eviction
[  157.019664] [TTM] No space for ffff97a0b644a400 (342 pages, 1368K, 1M)
[  157.026184] [TTM]   placement[0]=3D0x00070002 (1)
[  157.030705] [TTM]     has_type: 1
[  157.034016] [TTM]     use_type: 1
[  157.037321] [TTM]     flags: 0x0000000A
[  157.041146] [TTM]     gpu_offset: 0x00000000
[  157.045405] [TTM]     size: 131072
[  157.048804] [TTM]     available_caching: 0x00070000
[  157.053669] [TTM]     default_caching: 0x00010000
[  157.058366] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  157.064540] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  157.070800] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  157.091766] [TTM] Failed to find memory space for buffer 0xffff97a0af140=
800
eviction
[  157.099564] [TTM] No space for ffff97a0af140800 (1366 pages, 5464K, 5M)
[  157.106166] [TTM]   placement[0]=3D0x00070002 (1)
[  157.110687] [TTM]     has_type: 1
[  157.113992] [TTM]     use_type: 1
[  157.117303] [TTM]     flags: 0x0000000A
[  157.121133] [TTM]     gpu_offset: 0x00000000
[  157.125393] [TTM]     size: 131072
[  157.128786] [TTM]     available_caching: 0x00070000
[  157.133658] [TTM]     default_caching: 0x00010000
[  157.138356] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  157.144524] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  157.150786] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  157.173464] [TTM] Failed to find memory space for buffer 0xffff97a0ad77b=
000
eviction
[  157.181258] [TTM] No space for ffff97a0ad77b000 (342 pages, 1368K, 1M)
[  157.187775] [TTM]   placement[0]=3D0x00070002 (1)
[  157.192296] [TTM]     has_type: 1
[  157.195601] [TTM]     use_type: 1
[  157.198912] [TTM]     flags: 0x0000000A
[  157.202740] [TTM]     gpu_offset: 0x00000000
[  157.206999] [TTM]     size: 131072
[  157.210393] [TTM]     available_caching: 0x00070000
[  157.215265] [TTM]     default_caching: 0x00010000
[  157.219960] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  157.226126] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  157.232389] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  157.242751] [TTM] Failed to find memory space for buffer 0xffff97a0ad77b=
400
eviction
[  157.250552] [TTM] No space for ffff97a0ad77b400 (683 pages, 2732K, 2M)
[  157.257072] [TTM]   placement[0]=3D0x00070002 (1)
[  157.261592] [TTM]     has_type: 1
[  157.264906] [TTM]     use_type: 1
[  157.268211] [TTM]     flags: 0x0000000A
[  157.272036] [TTM]     gpu_offset: 0x00000000
[  157.276297] [TTM]     size: 131072
[  157.279689] [TTM]     available_caching: 0x00070000
[  157.284565] [TTM]     default_caching: 0x00010000
[  157.289260] nouveau 0000:08:00.0: plasmashell[882]: fail ttm_validate
[  157.295689] nouveau 0000:08:00.0: plasmashell[882]: validating bo list
[  157.302216] nouveau 0000:08:00.0: plasmashell[882]: validate: -12
[  157.325724] [TTM] Failed to find memory space for buffer 0xffff97a0aca8e=
400
eviction
[  157.333493] [TTM] No space for ffff97a0aca8e400 (683 pages, 2732K, 2M)
[  157.340008] [TTM]   placement[0]=3D0x00070002 (1)
[  157.344528] [TTM]     has_type: 1
[  157.347841] [TTM]     use_type: 1
[  157.351145] [TTM]     flags: 0x0000000A
[  157.354971] [TTM]     gpu_offset: 0x00000000
[  157.359230] [TTM]     size: 131072
[  157.362623] [TTM]     available_caching: 0x00070000
[  157.367495] [TTM]     default_caching: 0x00010000
[  157.372189] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  157.378357] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  157.384618] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  157.422790] [TTM] Failed to find memory space for buffer 0xffff97a0bc95c=
800
eviction
[  157.430536] [TTM] No space for ffff97a0bc95c800 (342 pages, 1368K, 1M)
[  157.437078] [TTM]   placement[0]=3D0x00070002 (1)
[  157.441604] [TTM]     has_type: 1
[  157.444911] [TTM]     use_type: 1
[  157.448226] [TTM]     flags: 0x0000000A
[  157.452050] [TTM]     gpu_offset: 0x00000000
[  157.456312] [TTM]     size: 131072
[  157.459704] [TTM]     available_caching: 0x00070000
[  157.464578] [TTM]     default_caching: 0x00010000
[  157.469279] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  157.475445] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  157.481713] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  172.075940] [TTM] Failed to find memory space for buffer 0xffff97a0ad77b=
c00
eviction
[  172.083746] [TTM] No space for ffff97a0ad77bc00 (342 pages, 1368K, 1M)
[  172.090270] [TTM]   placement[0]=3D0x00070002 (1)
[  172.094792] [TTM]     has_type: 1
[  172.098113] [TTM]     use_type: 1
[  172.101421] [TTM]     flags: 0x0000000A
[  172.105248] [TTM]     gpu_offset: 0x00000000
[  172.109508] [TTM]     size: 131072
[  172.112901] [TTM]     available_caching: 0x00070000
[  172.117775] [TTM]     default_caching: 0x00010000
[  172.122472] nouveau 0000:08:00.0: plasmashell[882]: fail ttm_validate
[  172.128900] nouveau 0000:08:00.0: plasmashell[882]: validating bo list
[  172.135434] nouveau 0000:08:00.0: plasmashell[882]: validate: -12
[  196.405489] [TTM] Failed to find memory space for buffer 0xffff97a0af159=
000
eviction
[  196.413321] [TTM] No space for ffff97a0af159000 (342 pages, 1368K, 1M)
[  196.419853] [TTM]   placement[0]=3D0x00070002 (1)
[  196.424386] [TTM]     has_type: 1
[  196.427691] [TTM]     use_type: 1
[  196.431017] [TTM]     flags: 0x0000000A
[  196.434841] [TTM]     gpu_offset: 0x00000000
[  196.439113] [TTM]     size: 131072
[  196.442508] [TTM]     available_caching: 0x00070000
[  196.447387] [TTM]     default_caching: 0x00010000
[  196.452087] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  196.458269] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  196.464543] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  196.568303] [TTM] Failed to find memory space for buffer 0xffff97a0af15c=
000
eviction
[  196.576048] [TTM] No space for ffff97a0af15c000 (342 pages, 1368K, 1M)
[  196.582583] [TTM]   placement[0]=3D0x00070002 (1)
[  196.587103] [TTM]     has_type: 1
[  196.590407] [TTM]     use_type: 1
[  196.593713] [TTM]     flags: 0x0000000A
[  196.597548] [TTM]     gpu_offset: 0x00000000
[  196.601809] [TTM]     size: 131072
[  196.605200] [TTM]     available_caching: 0x00070000
[  196.610064] [TTM]     default_caching: 0x00010000
[  196.614765] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  196.620932] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  196.627188] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  196.729650] [TTM] Failed to find memory space for buffer 0xffff97a0af15c=
400
eviction
[  196.737435] [TTM] No space for ffff97a0af15c400 (342 pages, 1368K, 1M)
[  196.743955] [TTM]   placement[0]=3D0x00070002 (1)
[  196.748483] [TTM]     has_type: 1
[  196.751789] [TTM]     use_type: 1
[  196.755096] [TTM]     flags: 0x0000000A
[  196.758922] [TTM]     gpu_offset: 0x00000000
[  196.763182] [TTM]     size: 131072
[  196.766581] [TTM]     available_caching: 0x00070000
[  196.771445] [TTM]     default_caching: 0x00010000
[  196.776142] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  196.782316] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  196.788574] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  196.900213] [TTM] Failed to find memory space for buffer 0xffff97a0b5876=
800
eviction
[  196.907986] [TTM] No space for ffff97a0b5876800 (342 pages, 1368K, 1M)
[  196.914524] [TTM]   placement[0]=3D0x00070002 (1)
[  196.919059] [TTM]     has_type: 1
[  196.922363] [TTM]     use_type: 1
[  196.925670] [TTM]     flags: 0x0000000A
[  196.929509] [TTM]     gpu_offset: 0x00000000
[  196.933774] [TTM]     size: 131072
[  196.937178] [TTM]     available_caching: 0x00070000
[  196.942059] [TTM]     default_caching: 0x00010000
[  196.946753] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  196.952943] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  196.959199] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  197.053958] [TTM] Failed to find memory space for buffer 0xffff97a0add68=
800
eviction
[  197.061737] [TTM] No space for ffff97a0add68800 (342 pages, 1368K, 1M)
[  197.068270] [TTM]   placement[0]=3D0x00070002 (1)
[  197.072793] [TTM]     has_type: 1
[  197.076097] [TTM]     use_type: 1
[  197.079403] [TTM]     flags: 0x0000000A
[  197.083236] [TTM]     gpu_offset: 0x00000000
[  197.087494] [TTM]     size: 131072
[  197.090887] [TTM]     available_caching: 0x00070000
[  197.095753] [TTM]     default_caching: 0x00010000
[  197.100454] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  197.106622] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  197.112876] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15038423770.E5C9bB7.1057
Date: Sun, 27 Aug 2017 13:59:37 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nv4x - memory problems when starting graphical applicatio=
n - logs included"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102430">102430</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nv4x - memory problems when starting graphical application - =
logs included
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>caguduzexi&#64;go2vpn.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When i start for example supertuxkart on a nv42 card, i get th=
ose errors:

[  114.511256] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 0400028
[  114.528921] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 03000248
[  114.546540] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 04000248
[  114.564160] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 03000248
[  115.000790] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 02000248
[  115.415427] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 02000248
[  117.220299] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 02000248
[  118.922242] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 04000248
[  118.939894] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 03000248
[  121.001922] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 04000248
[  121.019557] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 03000248
[  121.037178] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 04000248
[  121.054793] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 03000248
[  121.072409] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 04000248
[  121.090027] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 03000248
[  121.597086] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 02000248
[  121.769931] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 3 [00118000 supertuxkart[10=
74]]
subc 7 class 4097 mthd 0208 data 020




[  124.918095] [TTM] Failed to find memory space for buffer 0xffff97a0c738d=
c00
eviction
[  124.925842] [TTM] No space for ffff97a0c738dc00 (1366 pages, 5464K, 5M)
[  124.932458] [TTM]   placement[0]=3D0x00070002 (1)
[  124.936978] [TTM]     has_type: 1
[  124.940283] [TTM]     use_type: 1
[  124.943590] [TTM]     flags: 0x0000000A
[  124.947423] [TTM]     gpu_offset: 0x00000000
[  124.951679] [TTM]     size: 131072
[  124.955074] [TTM]     available_caching: 0x00070000
[  124.959940] [TTM]     default_caching: 0x00010000
[  124.967291] [TTM] Failed to find memory space for buffer 0xffff97a0c738d=
000
eviction
[  124.975042] [TTM] No space for ffff97a0c738d000 (1366 pages, 5464K, 5M)
[  124.981657] [TTM]   placement[0]=3D0x00070002 (1)
[  124.986176] [TTM]     has_type: 1
[  124.989482] [TTM]     use_type: 1
[  124.992787] [TTM]     flags: 0x0000000A
[  124.996611] [TTM]     gpu_offset: 0x00000000
[  125.000876] [TTM]     size: 131072
[  125.004268] [TTM]     available_caching: 0x00070000
[  125.009134] [TTM]     default_caching: 0x00010000
[  125.373168] [TTM] Failed to find memory space for buffer 0xffff97a0bca01=
c00
eviction
[  125.380959] [TTM] No space for ffff97a0bca01c00 (1366 pages, 5464K, 5M)
[  125.387562] [TTM]   placement[0]=3D0x00070002 (1)
[  125.392081] [TTM]     has_type: 1
[  125.395388] [TTM]     use_type: 1
[  125.398701] [TTM]     flags: 0x0000000A
[  125.402526] [TTM]     gpu_offset: 0x00000000
[  125.406784] [TTM]     size: 131072
[  125.410177] [TTM]     available_caching: 0x00070000
[  125.415051] [TTM]     default_caching: 0x00010000
[  125.422678] [TTM] Failed to find memory space for buffer 0xffff97a0bbf15=
000
eviction
[  125.430415] [TTM] No space for ffff97a0bbf15000 (1366 pages, 5464K, 5M)
[  125.437032] [TTM]   placement[0]=3D0x00070002 (1)
[  125.441557] [TTM]     has_type: 1
[  125.444860] [TTM]     use_type: 1
[  125.448173] [TTM]     flags: 0x0000000A
[  125.451999] [TTM]     gpu_offset: 0x00000000
[  125.456257] [TTM]     size: 131072
[  125.459649] [TTM]     available_caching: 0x00070000
[  125.464521] [TTM]     default_caching: 0x00010000
[  125.533498] [TTM] Failed to find memory space for buffer 0xffff97a0cfae3=
800
eviction
[  125.541280] [TTM] No space for ffff97a0cfae3800 (1366 pages, 5464K, 5M)
[  125.547897] [TTM]   placement[0]=3D0x00070002 (1)
[  125.552417] [TTM]     has_type: 1
[  125.555722] [TTM]     use_type: 1
[  125.559028] [TTM]     flags: 0x0000000A
[  125.562854] [TTM]     gpu_offset: 0x00000000
[  125.567122] [TTM]     size: 131072
[  125.570517] [TTM]     available_caching: 0x00070000
[  125.575383] [TTM]     default_caching: 0x00010000
[  125.581168] [TTM] Failed to find memory space for buffer 0xffff97a0cf90b=
000
eviction
[  125.588904] [TTM] No space for ffff97a0cf90b000 (1366 pages, 5464K, 5M)
[  125.595504] [TTM]   placement[0]=3D0x00070002 (1)
[  125.600034] [TTM]     has_type: 1
[  125.603341] [TTM]     use_type: 1
[  125.606645] [TTM]     flags: 0x0000000A
[  125.610474] [TTM]     gpu_offset: 0x00000000
[  125.614739] [TTM]     size: 131072
[  125.618129] [TTM]     available_caching: 0x00070000
[  125.622996] [TTM]     default_caching: 0x00010000
[  125.843046] [TTM] Failed to find memory space for buffer 0xffff97a0cf963=
400
eviction
[  125.850847] [TTM] No space for ffff97a0cf963400 (1366 pages, 5464K, 5M)
[  125.857455] [TTM]   placement[0]=3D0x00070002 (1)
[  125.861972] [TTM]     has_type: 1
[  125.865285] [TTM]     use_type: 1
[  125.868588] [TTM]     flags: 0x0000000A
[  125.872416] [TTM]     gpu_offset: 0x00000000
[  125.876674] [TTM]     size: 131072
[  125.880069] [TTM]     available_caching: 0x00070000
[  125.884940] [TTM]     default_caching: 0x00010000
[  125.891579] [TTM] Failed to find memory space for buffer 0xffff97a0c25c8=
800
eviction
[  125.899368] [TTM] No space for ffff97a0c25c8800 (1366 pages, 5464K, 5M)
[  125.905971] [TTM]   placement[0]=3D0x00070002 (1)
[  125.910493] [TTM]     has_type: 1
[  125.913798] [TTM]     use_type: 1
[  125.917111] [TTM]     flags: 0x0000000A
[  125.920935] [TTM]     gpu_offset: 0x00000000
[  125.925193] [TTM]     size: 131072
[  125.928585] [TTM]     available_caching: 0x00070000
[  125.933455] [TTM]     default_caching: 0x00010000
[  126.162405] [TTM] Failed to find memory space for buffer 0xffff97a0f2c4d=
c00
eviction
[  126.170158] [TTM] No space for ffff97a0f2c4dc00 (1366 pages, 5464K, 5M)
[  126.176766] [TTM]   placement[0]=3D0x00070002 (1)
[  126.181294] [TTM]     has_type: 1
[  126.184602] [TTM]     use_type: 1
[  126.187908] [TTM]     flags: 0x0000000A
[  126.191736] [TTM]     gpu_offset: 0x00000000
[  126.195994] [TTM]     size: 131072
[  126.199393] [TTM]     available_caching: 0x00070000
[  126.204257] [TTM]     default_caching: 0x00010000
[  126.210542] [TTM] Failed to find memory space for buffer 0xffff97a0c45a1=
800
eviction
[  126.218324] [TTM] No space for ffff97a0c45a1800 (1366 pages, 5464K, 5M)
[  126.224927] [TTM]   placement[0]=3D0x00070002 (1)
[  126.229447] [TTM]     has_type: 1
[  126.232758] [TTM]     use_type: 1
[  126.236065] [TTM]     flags: 0x0000000A
[  126.239890] [TTM]     gpu_offset: 0x00000000
[  126.244150] [TTM]     size: 131072
[  126.247549] [TTM]     available_caching: 0x00070000
[  126.252413] [TTM]     default_caching: 0x00010000
[  126.409003] [TTM] Failed to find memory space for buffer 0xffff97a0c738d=
400
eviction
[  126.416791] [TTM] No space for ffff97a0c738d400 (1366 pages, 5464K, 5M)
[  126.423398] [TTM]   placement[0]=3D0x00070002 (1)
[  126.427918] [TTM]     has_type: 1
[  126.431230] [TTM]     use_type: 1
[  126.434534] [TTM]     flags: 0x0000000A
[  126.438361] [TTM]     gpu_offset: 0x00000000
[  126.442620] [TTM]     size: 131072
[  126.446012] [TTM]     available_caching: 0x00070000
[  126.450884] [TTM]     default_caching: 0x00010000
[  126.458674] [TTM] Failed to find memory space for buffer 0xffff97a0bca01=
400
eviction
[  126.466453] [TTM] No space for ffff97a0bca01400 (342 pages, 1368K, 1M)
[  126.472969] [TTM]   placement[0]=3D0x00070002 (1)
[  126.477489] [TTM]     has_type: 1
[  126.480800] [TTM]     use_type: 1
[  126.484106] [TTM]     flags: 0x0000000A
[  126.487932] [TTM]     gpu_offset: 0x00000000
[  126.492191] [TTM]     size: 131072
[  126.495585] [TTM]     available_caching: 0x00070000
[  126.500458] [TTM]     default_caching: 0x00010000
[  126.677600] [TTM] Failed to find memory space for buffer 0xffff97a0b5057=
c00
eviction
[  126.685367] [TTM] No space for ffff97a0b5057c00 (342 pages, 1368K, 1M)
[  126.691887] [TTM]   placement[0]=3D0x00070002 (1)
[  126.696408] [TTM]     has_type: 1
[  126.699721] [TTM]     use_type: 1
[  126.703028] [TTM]     flags: 0x0000000A
[  126.706854] [TTM]     gpu_offset: 0x00000000
[  126.711115] [TTM]     size: 131072
[  126.714514] [TTM]     available_caching: 0x00070000
[  126.719377] [TTM]     default_caching: 0x00010000
[  126.727380] [TTM] Failed to find memory space for buffer 0xffff97a0cf963=
000
eviction
[  126.735127] [TTM] No space for ffff97a0cf963000 (342 pages, 1368K, 1M)
[  126.741640] [TTM]   placement[0]=3D0x00070002 (1)
[  126.746159] [TTM]     has_type: 1
[  126.749469] [TTM]     use_type: 1
[  126.752772] [TTM]     flags: 0x0000000A
[  126.756595] [TTM]     gpu_offset: 0x00000000
[  126.760856] [TTM]     size: 131072
[  126.764254] [TTM]     available_caching: 0x00070000
[  126.769120] [TTM]     default_caching: 0x00010000
[  126.827478] [TTM] Failed to find memory space for buffer 0xffff97a0bdf22=
800
eviction
[  126.835250] [TTM] No space for ffff97a0bdf22800 (342 pages, 1368K, 1M)
[  126.841773] [TTM]   placement[0]=3D0x00070002 (1)
[  126.846297] [TTM]     has_type: 1
[  126.849612] [TTM]     use_type: 1
[  126.852919] [TTM]     flags: 0x0000000A
[  126.856745] [TTM]     gpu_offset: 0x00000000
[  126.861005] [TTM]     size: 131072
[  126.864402] [TTM]     available_caching: 0x00070000
[  126.869269] [TTM]     default_caching: 0x00010000
[  126.875645] [TTM] Failed to find memory space for buffer 0xffff97a0c1bdc=
400
eviction
[  126.883403] [TTM] No space for ffff97a0c1bdc400 (342 pages, 1368K, 1M)
[  126.889922] [TTM]   placement[0]=3D0x00070002 (1)
[  126.894442] [TTM]     has_type: 1
[  126.897754] [TTM]     use_type: 1
[  126.901061] [TTM]     flags: 0x0000000A
[  126.904887] [TTM]     gpu_offset: 0x00000000
[  126.909146] [TTM]     size: 131072
[  126.912539] [TTM]     available_caching: 0x00070000
[  126.917416] [TTM]     default_caching: 0x00010000
[  127.279695] [TTM] Failed to find memory space for buffer 0xffff97a0c1bdc=
c00
eviction
[  127.287496] [TTM] No space for ffff97a0c1bdcc00 (1366 pages, 5464K, 5M)
[  127.294098] [TTM]   placement[0]=3D0x00070002 (1)
[  127.298627] [TTM]     has_type: 1
[  127.301932] [TTM]     use_type: 1
[  127.305239] [TTM]     flags: 0x0000000A
[  127.309064] [TTM]     gpu_offset: 0x00000000
[  127.313325] [TTM]     size: 131072
[  127.316723] [TTM]     available_caching: 0x00070000
[  127.321587] [TTM]     default_caching: 0x00010000
[  127.327900] [TTM] Failed to find memory space for buffer 0xffff97a0b8a6c=
800
eviction
[  127.335683] [TTM] No space for ffff97a0b8a6c800 (1366 pages, 5464K, 5M)
[  127.342287] [TTM]   placement[0]=3D0x00070002 (1)
[  127.346807] [TTM]     has_type: 1
[  127.350120] [TTM]     use_type: 1
[  127.353427] [TTM]     flags: 0x0000000A
[  127.357255] [TTM]     gpu_offset: 0x00000000
[  127.361514] [TTM]     size: 131072
[  127.364913] [TTM]     available_caching: 0x00070000
[  127.369777] [TTM]     default_caching: 0x00010000
[  127.663989] [TTM] Failed to find memory space for buffer 0xffff97a0cb1da=
c00
eviction
[  127.671799] [TTM] No space for ffff97a0cb1dac00 (683 pages, 2732K, 2M)
[  127.678324] [TTM]   placement[0]=3D0x00070002 (1)
[  127.682854] [TTM]     has_type: 1
[  127.686161] [TTM]     use_type: 1
[  127.689470] [TTM]     flags: 0x0000000A
[  127.693298] [TTM]     gpu_offset: 0x00000000
[  127.697568] [TTM]     size: 131072
[  127.700963] [TTM]     available_caching: 0x00070000
[  127.705828] [TTM]     default_caching: 0x00010000
[  127.757232] [TTM] Failed to find memory space for buffer 0xffff97a0b5e6d=
800
eviction
[  127.765015] [TTM] No space for ffff97a0b5e6d800 (342 pages, 1368K, 1M)
[  127.771533] [TTM]   placement[0]=3D0x00070002 (1)
[  127.776053] [TTM]     has_type: 1
[  127.779363] [TTM]     use_type: 1
[  127.782676] [TTM]     flags: 0x0000000A
[  127.786504] [TTM]     gpu_offset: 0x00000000
[  127.790762] [TTM]     size: 131072
[  127.794155] [TTM]     available_caching: 0x00070000
[  127.799027] [TTM]     default_caching: 0x00010000
[  127.808052] [TTM] Failed to find memory space for buffer 0xffff97a0b5e6d=
c00
eviction
[  127.815801] [TTM] No space for ffff97a0b5e6dc00 (342 pages, 1368K, 1M)
[  127.822317] [TTM]   placement[0]=3D0x00070002 (1)
[  127.826837] [TTM]     has_type: 1
[  127.830144] [TTM]     use_type: 1
[  127.833456] [TTM]     flags: 0x0000000A
[  127.837279] [TTM]     gpu_offset: 0x00000000
[  127.841539] [TTM]     size: 131072
[  127.844933] [TTM]     available_caching: 0x00070000
[  127.849804] [TTM]     default_caching: 0x00010000
[  127.946757] [TTM] Failed to find memory space for buffer 0xffff97a0b3d7e=
c00
eviction
[  127.954519] [TTM] No space for ffff97a0b3d7ec00 (342 pages, 1368K, 1M)
[  127.961044] [TTM]   placement[0]=3D0x00070002 (1)
[  127.965573] [TTM]     has_type: 1
[  127.968880] [TTM]     use_type: 1
[  127.972185] [TTM]     flags: 0x0000000A
[  127.976013] [TTM]     gpu_offset: 0x00000000
[  127.980273] [TTM]     size: 131072
[  127.983671] [TTM]     available_caching: 0x00070000
[  127.988536] [TTM]     default_caching: 0x00010000
[  127.995874] [TTM] Failed to find memory space for buffer 0xffff97a11fcf9=
800
eviction
[  128.003624] [TTM] No space for ffff97a11fcf9800 (342 pages, 1368K, 1M)
[  128.010140] [TTM]   placement[0]=3D0x00070002 (1)
[  128.014666] [TTM]     has_type: 1
[  128.017970] [TTM]     use_type: 1
[  128.021276] [TTM]     flags: 0x0000000A
[  128.025104] [TTM]     gpu_offset: 0x00000000
[  128.029362] [TTM]     size: 131072
[  128.032760] [TTM]     available_caching: 0x00070000
[  128.037632] [TTM]     default_caching: 0x00010000
[  128.276341] [TTM] Failed to find memory space for buffer 0xffff97a11fcf8=
400
eviction
[  128.284146] [TTM] No space for ffff97a11fcf8400 (342 pages, 1368K, 1M)
[  128.290670] [TTM]   placement[0]=3D0x00070002 (1)
[  128.295190] [TTM]     has_type: 1
[  128.298501] [TTM]     use_type: 1
[  128.301805] [TTM]     flags: 0x0000000A
[  128.305632] [TTM]     gpu_offset: 0x00000000
[  128.309891] [TTM]     size: 131072
[  128.313286] [TTM]     available_caching: 0x00070000
[  128.318158] [TTM]     default_caching: 0x00010000
[  128.375260] [TTM] Failed to find memory space for buffer 0xffff97a0ba6d5=
c00
eviction
[  128.383029] [TTM] No space for ffff97a0ba6d5c00 (342 pages, 1368K, 1M)
[  128.389546] [TTM]   placement[0]=3D0x00070002 (1)
[  128.394064] [TTM]     has_type: 1
[  128.397370] [TTM]     use_type: 1
[  128.400682] [TTM]     flags: 0x0000000A
[  128.404508] [TTM]     gpu_offset: 0x00000000
[  128.408767] [TTM]     size: 131072
[  128.412159] [TTM]     available_caching: 0x00070000
[  128.417031] [TTM]     default_caching: 0x00010000
[  128.424904] [TTM] Failed to find memory space for buffer 0xffff97a0b9974=
400
eviction
[  128.432652] [TTM] No space for ffff97a0b9974400 (342 pages, 1368K, 1M)
[  128.439166] [TTM]   placement[0]=3D0x00070002 (1)
[  128.443683] [TTM]     has_type: 1
[  128.446989] [TTM]     use_type: 1
[  128.450302] [TTM]     flags: 0x0000000A
[  128.454127] [TTM]     gpu_offset: 0x00000000
[  128.458386] [TTM]     size: 131072
[  128.461779] [TTM]     available_caching: 0x00070000
[  128.466651] [TTM]     default_caching: 0x00010000
[  128.587891] [TTM] Failed to find memory space for buffer 0xffff97a0b50e2=
000
eviction
[  128.595669] [TTM] No space for ffff97a0b50e2000 (342 pages, 1368K, 1M)
[  128.602202] [TTM]   placement[0]=3D0x00070002 (1)
[  128.606722] [TTM]     has_type: 1
[  128.610034] [TTM]     use_type: 1
[  128.613338] [TTM]     flags: 0x0000000A
[  128.617171] [TTM]     gpu_offset: 0x00000000
[  128.621428] [TTM]     size: 131072
[  128.624824] [TTM]     available_caching: 0x00070000
[  128.629687] [TTM]     default_caching: 0x00010000
[  128.638099] [TTM] Failed to find memory space for buffer 0xffff97a0b3d7e=
000
eviction
[  128.645866] [TTM] No space for ffff97a0b3d7e000 (342 pages, 1368K, 1M)
[  128.652397] [TTM]   placement[0]=3D0x00070002 (1)
[  128.656917] [TTM]     has_type: 1
[  128.660223] [TTM]     use_type: 1
[  128.663529] [TTM]     flags: 0x0000000A
[  128.667363] [TTM]     gpu_offset: 0x00000000
[  128.671621] [TTM]     size: 131072
[  128.675013] [TTM]     available_caching: 0x00070000
[  128.679879] [TTM]     default_caching: 0x00010000
[  128.905310] [TTM] Failed to find memory space for buffer 0xffff97a11fd0c=
000
eviction
[  128.913085] [TTM] No space for ffff97a11fd0c000 (342 pages, 1368K, 1M)
[  128.919644] [TTM]   placement[0]=3D0x00070002 (1)
[  128.924176] [TTM]     has_type: 1
[  128.927487] [TTM]     use_type: 1
[  128.930809] [TTM]     flags: 0x0000000A
[  128.934643] [TTM]     gpu_offset: 0x00000000
[  128.938910] [TTM]     size: 131072
[  128.942306] [TTM]     available_caching: 0x00070000
[  128.947177] [TTM]     default_caching: 0x00010000
[  128.956869] [TTM] Failed to find memory space for buffer 0xffff97a0b3d6d=
400
eviction
[  128.964653] [TTM] No space for ffff97a0b3d6d400 (342 pages, 1368K, 1M)
[  128.971169] [TTM]   placement[0]=3D0x00070002 (1)
[  128.975693] [TTM]     has_type: 1
[  128.978997] [TTM]     use_type: 1
[  128.982310] [TTM]     flags: 0x0000000A
[  128.986133] [TTM]     gpu_offset: 0x00000000
[  128.990392] [TTM]     size: 131072
[  128.993787] [TTM]     available_caching: 0x00070000
[  128.998660] [TTM]     default_caching: 0x00010000
[  129.079184] [TTM] Failed to find memory space for buffer 0xffff97a0b7ad3=
000
eviction
[  129.086992] [TTM] No space for ffff97a0b7ad3000 (342 pages, 1368K, 1M)
[  129.093517] [TTM]   placement[0]=3D0x00070002 (1)
[  129.098045] [TTM]     has_type: 1
[  129.101351] [TTM]     use_type: 1
[  129.104656] [TTM]     flags: 0x0000000A
[  129.108484] [TTM]     gpu_offset: 0x00000000
[  129.112744] [TTM]     size: 131072
[  129.116146] [TTM]     available_caching: 0x00070000
[  129.121015] [TTM]     default_caching: 0x00010000
[  129.275685] [TTM] Failed to find memory space for buffer 0xffff97a0b5bb9=
000
eviction
[  129.283454] [TTM] No space for ffff97a0b5bb9000 (342 pages, 1368K, 1M)
[  129.289973] [TTM]   placement[0]=3D0x00070002 (1)
[  129.294496] [TTM]     has_type: 1
[  129.297809] [TTM]     use_type: 1
[  129.301116] [TTM]     flags: 0x0000000A
[  129.304942] [TTM]     gpu_offset: 0x00000000
[  129.309203] [TTM]     size: 131072
[  129.312592] [TTM]     available_caching: 0x00070000
[  129.317464] [TTM]     default_caching: 0x00010000
[  129.322161] nouveau 0000:08:00.0: supertuxkart[1074]: fail ttm_validate
[  129.328763] nouveau 0000:08:00.0: supertuxkart[1074]: validating bo list
[  129.335460] nouveau 0000:08:00.0: supertuxkart[1074]: validate: -12
[  129.385472] [TTM] Failed to find memory space for buffer 0xffff97a0b3dd7=
000
eviction
[  129.393239] [TTM] No space for ffff97a0b3dd7000 (342 pages, 1368K, 1M)
[  129.399777] [TTM]   placement[0]=3D0x00070002 (1)
[  129.404294] [TTM]     has_type: 1
[  129.407601] [TTM]     use_type: 1
[  129.410905] [TTM]     flags: 0x0000000A
[  129.414740] [TTM]     gpu_offset: 0x00000000
[  129.419002] [TTM]     size: 131072
[  129.422395] [TTM]     available_caching: 0x00070000
[  129.427260] [TTM]     default_caching: 0x00010000
[  129.431963] nouveau 0000:08:00.0: supertuxkart[1074]: fail ttm_validate
[  129.438563] nouveau 0000:08:00.0: supertuxkart[1074]: validating bo list
[  129.445252] nouveau 0000:08:00.0: supertuxkart[1074]: validate: -12
[  129.491823] [TTM] Failed to find memory space for buffer 0xffff97a0b9974=
000
eviction
[  129.499574] [TTM] No space for ffff97a0b9974000 (342 pages, 1368K, 1M)
[  129.506090] [TTM]   placement[0]=3D0x00070002 (1)
[  129.510611] [TTM]     has_type: 1
[  129.513915] [TTM]     use_type: 1
[  129.517229] [TTM]     flags: 0x0000000A
[  129.521057] [TTM]     gpu_offset: 0x00000000
[  129.525317] [TTM]     size: 131072
[  129.528708] [TTM]     available_caching: 0x00070000
[  129.533583] [TTM]     default_caching: 0x00010000
[  129.538280] nouveau 0000:08:00.0: supertuxkart[1074]: fail ttm_validate
[  129.544882] nouveau 0000:08:00.0: supertuxkart[1074]: validating bo list
[  129.551577] nouveau 0000:08:00.0: supertuxkart[1074]: validate: -12
[  155.869283] [TTM] Failed to find memory space for buffer 0xffff97a0b3c80=
c00
eviction
[  155.877087] [TTM] No space for ffff97a0b3c80c00 (1366 pages, 5464K, 5M)
[  155.883714] [TTM]   placement[0]=3D0x00070002 (1)
[  155.888246] [TTM]     has_type: 1
[  155.891549] [TTM]     use_type: 1
[  155.894854] [TTM]     flags: 0x0000000A
[  155.898699] [TTM]     gpu_offset: 0x00000000
[  155.902961] [TTM]     size: 131072
[  155.906370] [TTM]     available_caching: 0x00070000
[  155.911249] [TTM]     default_caching: 0x00010000
[  155.915953] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  155.922132] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  155.928400] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  155.954315] [TTM] Failed to find memory space for buffer 0xffff97a0b3d6d=
c00
eviction
[  155.962090] [TTM] No space for ffff97a0b3d6dc00 (342 pages, 1368K, 1M)
[  155.968643] [TTM]   placement[0]=3D0x00070002 (1)
[  155.973164] [TTM]     has_type: 1
[  155.976482] [TTM]     use_type: 1
[  155.979787] [TTM]     flags: 0x0000000A
[  155.983635] [TTM]     gpu_offset: 0x00000000
[  155.987896] [TTM]     size: 131072
[  155.991301] [TTM]     available_caching: 0x00070000
[  155.996168] [TTM]     default_caching: 0x00010000
[  156.000884] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  156.007050] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  156.013305] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  156.040417] [TTM] Failed to find memory space for buffer 0xffff97a0b5bb9=
800
eviction
[  156.048178] [TTM] No space for ffff97a0b5bb9800 (1366 pages, 5464K, 5M)
[  156.054785] [TTM]   placement[0]=3D0x00070002 (1)
[  156.059304] [TTM]     has_type: 1
[  156.062608] [TTM]     use_type: 1
[  156.065922] [TTM]     flags: 0x0000000A
[  156.069746] [TTM]     gpu_offset: 0x00000000
[  156.074005] [TTM]     size: 131072
[  156.077398] [TTM]     available_caching: 0x00070000
[  156.082270] [TTM]     default_caching: 0x00010000
[  156.086964] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  156.093130] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  156.099391] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  156.124483] [TTM] Failed to find memory space for buffer 0xffff97a0b5afc=
000
eviction
[  156.132241] [TTM] No space for ffff97a0b5afc000 (1366 pages, 5464K, 5M)
[  156.138844] [TTM]   placement[0]=3D0x00070002 (1)
[  156.143365] [TTM]     has_type: 1
[  156.146669] [TTM]     use_type: 1
[  156.149982] [TTM]     flags: 0x0000000A
[  156.153811] [TTM]     gpu_offset: 0x00000000
[  156.158070] [TTM]     size: 131072
[  156.161462] [TTM]     available_caching: 0x00070000
[  156.166336] [TTM]     default_caching: 0x00010000
[  156.171028] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  156.177193] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  156.183454] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  156.303792] [TTM] Failed to find memory space for buffer 0xffff97a0b6409=
c00
eviction
[  156.311536] [TTM] No space for ffff97a0b6409c00 (342 pages, 1368K, 1M)
[  156.318077] [TTM]   placement[0]=3D0x00070002 (1)
[  156.322600] [TTM]     has_type: 1
[  156.325904] [TTM]     use_type: 1
[  156.329210] [TTM]     flags: 0x0000000A
[  156.333042] [TTM]     gpu_offset: 0x00000000
[  156.337301] [TTM]     size: 131072
[  156.340693] [TTM]     available_caching: 0x00070000
[  156.345562] [TTM]     default_caching: 0x00010000
[  156.350263] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  156.356429] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  156.362716] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  156.372060] [TTM] Failed to find memory space for buffer 0xffff97a0b6409=
000
eviction
[  156.379810] [TTM] No space for ffff97a0b6409000 (342 pages, 1368K, 1M)
[  156.386347] [TTM]   placement[0]=3D0x00070002 (1)
[  156.390869] [TTM]     has_type: 1
[  156.394205] [TTM]     use_type: 1
[  156.397519] [TTM]     flags: 0x0000000A
[  156.401345] [TTM]     gpu_offset: 0x00000000
[  156.405607] [TTM]     size: 131072
[  156.409013] [TTM]     available_caching: 0x00070000
[  156.413878] [TTM]     default_caching: 0x00010000
[  156.418579] nouveau 0000:08:00.0: plasmashell[882]: fail ttm_validate
[  156.425005] nouveau 0000:08:00.0: plasmashell[882]: validating bo list
[  156.431532] nouveau 0000:08:00.0: plasmashell[882]: validate: -12
[  156.458218] [TTM] Failed to find memory space for buffer 0xffff97a0bc99d=
000
eviction
[  156.465982] [TTM] No space for ffff97a0bc99d000 (342 pages, 1368K, 1M)
[  156.472497] [TTM]   placement[0]=3D0x00070002 (1)
[  156.477018] [TTM]     has_type: 1
[  156.480322] [TTM]     use_type: 1
[  156.483635] [TTM]     flags: 0x0000000A
[  156.487461] [TTM]     gpu_offset: 0x00000000
[  156.491719] [TTM]     size: 131072
[  156.495111] [TTM]     available_caching: 0x00070000
[  156.499984] [TTM]     default_caching: 0x00010000
[  156.504678] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  156.510847] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  156.517109] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  156.553730] [TTM] Failed to find memory space for buffer 0xffff97a0b3c3d=
400
eviction
[  156.561476] [TTM] No space for ffff97a0b3c3d400 (342 pages, 1368K, 1M)
[  156.568010] [TTM]   placement[0]=3D0x00070002 (1)
[  156.572530] [TTM]     has_type: 1
[  156.575834] [TTM]     use_type: 1
[  156.579143] [TTM]     flags: 0x0000000A
[  156.582974] [TTM]     gpu_offset: 0x00000000
[  156.587233] [TTM]     size: 131072
[  156.590626] [TTM]     available_caching: 0x00070000
[  156.595492] [TTM]     default_caching: 0x00010000
[  156.600193] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  156.606359] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  156.612615] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  156.639185] [TTM] Failed to find memory space for buffer 0xffff97a0af072=
800
eviction
[  156.646963] [TTM] No space for ffff97a0af072800 (342 pages, 1368K, 1M)
[  156.653498] [TTM]   placement[0]=3D0x00070002 (1)
[  156.658016] [TTM]     has_type: 1
[  156.661322] [TTM]     use_type: 1
[  156.664635] [TTM]     flags: 0x0000000A
[  156.668464] [TTM]     gpu_offset: 0x00000000
[  156.672723] [TTM]     size: 131072
[  156.676114] [TTM]     available_caching: 0x00070000
[  156.680988] [TTM]     default_caching: 0x00010000
[  156.685681] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  156.691849] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  156.698144] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  156.839229] [TTM] Failed to find memory space for buffer 0xffff97a0b5876=
000
eviction
[  156.847002] [TTM] No space for ffff97a0b5876000 (342 pages, 1368K, 1M)
[  156.853544] [TTM]   placement[0]=3D0x00070002 (1)
[  156.858081] [TTM]     has_type: 1
[  156.861390] [TTM]     use_type: 1
[  156.864719] [TTM]     flags: 0x0000000A
[  156.868547] [TTM]     gpu_offset: 0x00000000
[  156.872823] [TTM]     size: 131072
[  156.876216] [TTM]     available_caching: 0x00070000
[  156.881103] [TTM]     default_caching: 0x00010000
[  156.885801] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  156.891983] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  156.898267] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  156.928358] [TTM] Failed to find memory space for buffer 0xffff97a0b5afc=
400
eviction
[  156.936149] [TTM] No space for ffff97a0b5afc400 (1366 pages, 5464K, 5M)
[  156.942757] [TTM]   placement[0]=3D0x00070002 (1)
[  156.947276] [TTM]     has_type: 1
[  156.950588] [TTM]     use_type: 1
[  156.953892] [TTM]     flags: 0x0000000A
[  156.957717] [TTM]     gpu_offset: 0x00000000
[  156.961977] [TTM]     size: 131072
[  156.965376] [TTM]     available_caching: 0x00070000
[  156.970241] [TTM]     default_caching: 0x00010000
[  156.974937] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  156.981111] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  156.987364] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  157.011900] [TTM] Failed to find memory space for buffer 0xffff97a0b644a=
400
eviction
[  157.019664] [TTM] No space for ffff97a0b644a400 (342 pages, 1368K, 1M)
[  157.026184] [TTM]   placement[0]=3D0x00070002 (1)
[  157.030705] [TTM]     has_type: 1
[  157.034016] [TTM]     use_type: 1
[  157.037321] [TTM]     flags: 0x0000000A
[  157.041146] [TTM]     gpu_offset: 0x00000000
[  157.045405] [TTM]     size: 131072
[  157.048804] [TTM]     available_caching: 0x00070000
[  157.053669] [TTM]     default_caching: 0x00010000
[  157.058366] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  157.064540] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  157.070800] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  157.091766] [TTM] Failed to find memory space for buffer 0xffff97a0af140=
800
eviction
[  157.099564] [TTM] No space for ffff97a0af140800 (1366 pages, 5464K, 5M)
[  157.106166] [TTM]   placement[0]=3D0x00070002 (1)
[  157.110687] [TTM]     has_type: 1
[  157.113992] [TTM]     use_type: 1
[  157.117303] [TTM]     flags: 0x0000000A
[  157.121133] [TTM]     gpu_offset: 0x00000000
[  157.125393] [TTM]     size: 131072
[  157.128786] [TTM]     available_caching: 0x00070000
[  157.133658] [TTM]     default_caching: 0x00010000
[  157.138356] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  157.144524] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  157.150786] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  157.173464] [TTM] Failed to find memory space for buffer 0xffff97a0ad77b=
000
eviction
[  157.181258] [TTM] No space for ffff97a0ad77b000 (342 pages, 1368K, 1M)
[  157.187775] [TTM]   placement[0]=3D0x00070002 (1)
[  157.192296] [TTM]     has_type: 1
[  157.195601] [TTM]     use_type: 1
[  157.198912] [TTM]     flags: 0x0000000A
[  157.202740] [TTM]     gpu_offset: 0x00000000
[  157.206999] [TTM]     size: 131072
[  157.210393] [TTM]     available_caching: 0x00070000
[  157.215265] [TTM]     default_caching: 0x00010000
[  157.219960] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  157.226126] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  157.232389] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  157.242751] [TTM] Failed to find memory space for buffer 0xffff97a0ad77b=
400
eviction
[  157.250552] [TTM] No space for ffff97a0ad77b400 (683 pages, 2732K, 2M)
[  157.257072] [TTM]   placement[0]=3D0x00070002 (1)
[  157.261592] [TTM]     has_type: 1
[  157.264906] [TTM]     use_type: 1
[  157.268211] [TTM]     flags: 0x0000000A
[  157.272036] [TTM]     gpu_offset: 0x00000000
[  157.276297] [TTM]     size: 131072
[  157.279689] [TTM]     available_caching: 0x00070000
[  157.284565] [TTM]     default_caching: 0x00010000
[  157.289260] nouveau 0000:08:00.0: plasmashell[882]: fail ttm_validate
[  157.295689] nouveau 0000:08:00.0: plasmashell[882]: validating bo list
[  157.302216] nouveau 0000:08:00.0: plasmashell[882]: validate: -12
[  157.325724] [TTM] Failed to find memory space for buffer 0xffff97a0aca8e=
400
eviction
[  157.333493] [TTM] No space for ffff97a0aca8e400 (683 pages, 2732K, 2M)
[  157.340008] [TTM]   placement[0]=3D0x00070002 (1)
[  157.344528] [TTM]     has_type: 1
[  157.347841] [TTM]     use_type: 1
[  157.351145] [TTM]     flags: 0x0000000A
[  157.354971] [TTM]     gpu_offset: 0x00000000
[  157.359230] [TTM]     size: 131072
[  157.362623] [TTM]     available_caching: 0x00070000
[  157.367495] [TTM]     default_caching: 0x00010000
[  157.372189] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  157.378357] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  157.384618] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  157.422790] [TTM] Failed to find memory space for buffer 0xffff97a0bc95c=
800
eviction
[  157.430536] [TTM] No space for ffff97a0bc95c800 (342 pages, 1368K, 1M)
[  157.437078] [TTM]   placement[0]=3D0x00070002 (1)
[  157.441604] [TTM]     has_type: 1
[  157.444911] [TTM]     use_type: 1
[  157.448226] [TTM]     flags: 0x0000000A
[  157.452050] [TTM]     gpu_offset: 0x00000000
[  157.456312] [TTM]     size: 131072
[  157.459704] [TTM]     available_caching: 0x00070000
[  157.464578] [TTM]     default_caching: 0x00010000
[  157.469279] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  157.475445] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  157.481713] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  172.075940] [TTM] Failed to find memory space for buffer 0xffff97a0ad77b=
c00
eviction
[  172.083746] [TTM] No space for ffff97a0ad77bc00 (342 pages, 1368K, 1M)
[  172.090270] [TTM]   placement[0]=3D0x00070002 (1)
[  172.094792] [TTM]     has_type: 1
[  172.098113] [TTM]     use_type: 1
[  172.101421] [TTM]     flags: 0x0000000A
[  172.105248] [TTM]     gpu_offset: 0x00000000
[  172.109508] [TTM]     size: 131072
[  172.112901] [TTM]     available_caching: 0x00070000
[  172.117775] [TTM]     default_caching: 0x00010000
[  172.122472] nouveau 0000:08:00.0: plasmashell[882]: fail ttm_validate
[  172.128900] nouveau 0000:08:00.0: plasmashell[882]: validating bo list
[  172.135434] nouveau 0000:08:00.0: plasmashell[882]: validate: -12
[  196.405489] [TTM] Failed to find memory space for buffer 0xffff97a0af159=
000
eviction
[  196.413321] [TTM] No space for ffff97a0af159000 (342 pages, 1368K, 1M)
[  196.419853] [TTM]   placement[0]=3D0x00070002 (1)
[  196.424386] [TTM]     has_type: 1
[  196.427691] [TTM]     use_type: 1
[  196.431017] [TTM]     flags: 0x0000000A
[  196.434841] [TTM]     gpu_offset: 0x00000000
[  196.439113] [TTM]     size: 131072
[  196.442508] [TTM]     available_caching: 0x00070000
[  196.447387] [TTM]     default_caching: 0x00010000
[  196.452087] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  196.458269] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  196.464543] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  196.568303] [TTM] Failed to find memory space for buffer 0xffff97a0af15c=
000
eviction
[  196.576048] [TTM] No space for ffff97a0af15c000 (342 pages, 1368K, 1M)
[  196.582583] [TTM]   placement[0]=3D0x00070002 (1)
[  196.587103] [TTM]     has_type: 1
[  196.590407] [TTM]     use_type: 1
[  196.593713] [TTM]     flags: 0x0000000A
[  196.597548] [TTM]     gpu_offset: 0x00000000
[  196.601809] [TTM]     size: 131072
[  196.605200] [TTM]     available_caching: 0x00070000
[  196.610064] [TTM]     default_caching: 0x00010000
[  196.614765] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  196.620932] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  196.627188] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  196.729650] [TTM] Failed to find memory space for buffer 0xffff97a0af15c=
400
eviction
[  196.737435] [TTM] No space for ffff97a0af15c400 (342 pages, 1368K, 1M)
[  196.743955] [TTM]   placement[0]=3D0x00070002 (1)
[  196.748483] [TTM]     has_type: 1
[  196.751789] [TTM]     use_type: 1
[  196.755096] [TTM]     flags: 0x0000000A
[  196.758922] [TTM]     gpu_offset: 0x00000000
[  196.763182] [TTM]     size: 131072
[  196.766581] [TTM]     available_caching: 0x00070000
[  196.771445] [TTM]     default_caching: 0x00010000
[  196.776142] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  196.782316] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  196.788574] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  196.900213] [TTM] Failed to find memory space for buffer 0xffff97a0b5876=
800
eviction
[  196.907986] [TTM] No space for ffff97a0b5876800 (342 pages, 1368K, 1M)
[  196.914524] [TTM]   placement[0]=3D0x00070002 (1)
[  196.919059] [TTM]     has_type: 1
[  196.922363] [TTM]     use_type: 1
[  196.925670] [TTM]     flags: 0x0000000A
[  196.929509] [TTM]     gpu_offset: 0x00000000
[  196.933774] [TTM]     size: 131072
[  196.937178] [TTM]     available_caching: 0x00070000
[  196.942059] [TTM]     default_caching: 0x00010000
[  196.946753] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  196.952943] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  196.959199] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12
[  197.053958] [TTM] Failed to find memory space for buffer 0xffff97a0add68=
800
eviction
[  197.061737] [TTM] No space for ffff97a0add68800 (342 pages, 1368K, 1M)
[  197.068270] [TTM]   placement[0]=3D0x00070002 (1)
[  197.072793] [TTM]     has_type: 1
[  197.076097] [TTM]     use_type: 1
[  197.079403] [TTM]     flags: 0x0000000A
[  197.083236] [TTM]     gpu_offset: 0x00000000
[  197.087494] [TTM]     size: 131072
[  197.090887] [TTM]     available_caching: 0x00070000
[  197.095753] [TTM]     default_caching: 0x00010000
[  197.100454] nouveau 0000:08:00.0: kwin_x11[877]: fail ttm_validate
[  197.106622] nouveau 0000:08:00.0: kwin_x11[877]: validating bo list
[  197.112876] nouveau 0000:08:00.0: kwin_x11[877]: validate: -12</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15038423770.E5C9bB7.1057--

--===============1724469752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1724469752==--
