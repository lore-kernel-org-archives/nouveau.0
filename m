From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93934] DRI_PRIME=1: DeadIsland crash
Date: Thu, 19 May 2016 04:41:11 +0000
Message-ID: <bug-93934-8800-5h64AIuy8d@http.bugs.freedesktop.org/>
References: <bug-93934-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0540603255=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93934-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0540603255==
Content-Type: multipart/alternative; boundary="14636328710.F49fFCADe.22865";
 charset="UTF-8"


--14636328710.F49fFCADe.22865
Date: Thu, 19 May 2016 04:41:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D93934

--- Comment #5 from Marcos Souza <marcos.souza.org-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
New information, using GDB it shows the crash:
#0  0xf703fe16 in __strchr_sse2_bsf () from /lib/libc.so.6
#1  0x09e20afc in ExtractDescriptions(ttl::string_base<char> const&) ()
#2  0x09e23724 in Renderer::RCreateShaderHwResources(_RSeparateShaderObject=
*&,
_RCompiledByteCode*, EShaderProfile::TYPE) ()
#3  0x09dff13a in CPShader::CPShader(ClassReaderResolve*) ()
#4  0x09dff8a8 in ConstructMaterial(void*, unsigned int, unsigned int, void=
*)
()
#5  0x09e9862d in ClassReader::Resolve(bool (*)(void*, unsigned int, unsign=
ed
int, void*), void*) ()
#6  0x09a9db47 in
CRLRPlatformLinux::RegisterMaterialResource(CResourceDataPack*,
RDPLogicalResourceEntryHeader*) ()
#7  0x09d0b2de in
CResourceLoadingRuntimeCommons::RegisterResources(CResourceDataPack*, EResT=
ype,
void (CResourceLoadingRuntimeCommons::*)(CResourceDataPack*,
RDPLogicalResourceEntryHeader*)) ()
#8  0x09a9dd30 in CRLRPlatformLinux::OnLoadComplete(CResourceDataPack*) ()
#9  0x09aaf90c in CResourceDataPack::LoadDataTasks(ttl::vectorm<(EMem::TYPE=
)40,
CResourceDataPack::LoadTask>&, bool) ()
#10 0x09aafa88 in CResourceDataPack::LoadData(bool) ()
#11 0x09a99f51 in CResourceLoadingRuntime::LoadPack(char const*,
CResourceDataPack**, unsigned int) ()
#12 0x0985a9db in CLevel::CLevel(ILevel*) ()
#13 0x097d97b6 in CFactory::CreateObject(CRTTI const*, CGSObject*, bool,
unsigned char, unsigned long long, bool) ()
#14 0x09bd0ea1 in CSerializableObject::ChunkLoadGSObject(fs::ifile&, long, =
int,
CGSObject*, CRTTI const*) ()
#15 0x097cda11 in CGame::LoadChunk(fs::ifile&, unsigned short, long) ()
#16 0x09bd14f7 in CSerializableObject::BaseLoad(fs::ifile&, long) ()
#17 0x09bd1611 in CSerializableObject::Load(fs::ifile&, long) ()
#18 0x097d1353 in CGame::SafeLoad(char const*, fs::ifile&, long) ()
#19 0x097d5140 in CGame::LoadGameModuleInternal(char const*, CGSObject*,
IProgressIndicator*) ()
#20 0x097dda1d in IGame::LoadModule(ttl::string_base<char> const&, IGSObjec=
t*,
IProgressIndicator*) ()
#21 0x08ac4014 in SessionDI::LoadLevel() ()
#22 0x08aa4267 in SessionCooperative::LoadLevel() ()
#23 0x08ac9b21 in SessionDI::ChangeActiveLevel() ()
#24 0x097d1d48 in CGame::CallFrameEndHandlers() ()
#25 0x097d244a in CGame::Frame(bool, bool) ()
#26 0x097cdeae in CGame::OnPaint() ()
#27 0x097cd473 in CGame::DoSdlLoop() ()
#28 0x088f4712 in main ()

The output is the same on Haswell and nouveau, this is isn't related to mes=
a?

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14636328710.F49fFCADe.22865
Date: Thu, 19 May 2016 04:41:11 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - DRI_PRIME=3D1: DeadIsland crash"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93934#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - DRI_PRIME=3D1: DeadIsland crash"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93934">bug 93934<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
marcos.souza.org&#64;gmail.com" title=3D"Marcos Souza &lt;marcos.souza.org&=
#64;gmail.com&gt;"> <span class=3D"fn">Marcos Souza</span></a>
</span></b>
        <pre>New information, using GDB it shows the crash:
#0  0xf703fe16 in __strchr_sse2_bsf () from /lib/libc.so.6
#1  0x09e20afc in ExtractDescriptions(ttl::string_base&lt;char&gt; const&am=
p;) ()
#2  0x09e23724 in Renderer::RCreateShaderHwResources(_RSeparateShaderObject=
*&amp;,
_RCompiledByteCode*, EShaderProfile::TYPE) ()
#3  0x09dff13a in CPShader::CPShader(ClassReaderResolve*) ()
#4  0x09dff8a8 in ConstructMaterial(void*, unsigned int, unsigned int, void=
*)
()
#5  0x09e9862d in ClassReader::Resolve(bool (*)(void*, unsigned int, unsign=
ed
int, void*), void*) ()
#6  0x09a9db47 in
CRLRPlatformLinux::RegisterMaterialResource(CResourceDataPack*,
RDPLogicalResourceEntryHeader*) ()
#7  0x09d0b2de in
CResourceLoadingRuntimeCommons::RegisterResources(CResourceDataPack*, EResT=
ype,
void (CResourceLoadingRuntimeCommons::*)(CResourceDataPack*,
RDPLogicalResourceEntryHeader*)) ()
#8  0x09a9dd30 in CRLRPlatformLinux::OnLoadComplete(CResourceDataPack*) ()
#9  0x09aaf90c in CResourceDataPack::LoadDataTasks(ttl::vectorm&lt;(EMem::T=
YPE)40,
CResourceDataPack::LoadTask&gt;&amp;, bool) ()
#10 0x09aafa88 in CResourceDataPack::LoadData(bool) ()
#11 0x09a99f51 in CResourceLoadingRuntime::LoadPack(char const*,
CResourceDataPack**, unsigned int) ()
#12 0x0985a9db in CLevel::CLevel(ILevel*) ()
#13 0x097d97b6 in CFactory::CreateObject(CRTTI const*, CGSObject*, bool,
unsigned char, unsigned long long, bool) ()
#14 0x09bd0ea1 in CSerializableObject::ChunkLoadGSObject(fs::ifile&amp;, lo=
ng, int,
CGSObject*, CRTTI const*) ()
#15 0x097cda11 in CGame::LoadChunk(fs::ifile&amp;, unsigned short, long) ()
#16 0x09bd14f7 in CSerializableObject::BaseLoad(fs::ifile&amp;, long) ()
#17 0x09bd1611 in CSerializableObject::Load(fs::ifile&amp;, long) ()
#18 0x097d1353 in CGame::SafeLoad(char const*, fs::ifile&amp;, long) ()
#19 0x097d5140 in CGame::LoadGameModuleInternal(char const*, CGSObject*,
IProgressIndicator*) ()
#20 0x097dda1d in IGame::LoadModule(ttl::string_base&lt;char&gt; const&amp;=
, IGSObject*,
IProgressIndicator*) ()
#21 0x08ac4014 in SessionDI::LoadLevel() ()
#22 0x08aa4267 in SessionCooperative::LoadLevel() ()
#23 0x08ac9b21 in SessionDI::ChangeActiveLevel() ()
#24 0x097d1d48 in CGame::CallFrameEndHandlers() ()
#25 0x097d244a in CGame::Frame(bool, bool) ()
#26 0x097cdeae in CGame::OnPaint() ()
#27 0x097cd473 in CGame::DoSdlLoop() ()
#28 0x088f4712 in main ()

The output is the same on Haswell and nouveau, this is isn't related to mes=
a?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14636328710.F49fFCADe.22865--

--===============0540603255==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0540603255==--
