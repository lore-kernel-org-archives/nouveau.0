From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70326] [NVF0] Kernel/Driver fails to initialize
 acceleration on GTX Titan
Date: Wed, 09 Oct 2013 18:29:11 +0000
Message-ID: <bug-70326-8800-03bzLS48Qo@http.bugs.freedesktop.org/>
References: <bug-70326-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0809524474=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70326-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0809524474==
Content-Type: multipart/alternative; boundary="1381343351.2f702.14107"; charset="us-ascii"


--1381343351.2f702.14107
Date: Wed, 9 Oct 2013 18:29:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70326

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
You need to mmiotrace the blob and get the graph firmware. See
http://nouveau.freedesktop.org/wiki/NVC0_Firmware/ (up to "Video Firmware",
which you don't need to worry about). Once you get that, stick the files in
/lib/firmware/nouveau and boot with nouveau.config=NvGrUseFW=1,PGRAPH=1 .
Built-in firmware is being worked on, afaik, but currently incomplete. There is
preliminary support you could use if you like, see
drivers/gpu/drm/nouveau/core/engine/graph/nvf0.c:

    .fecs.ucode = 0 ? &nvf0_graph_fecs_ucode : NULL,

Just change that to 1 ? instead of 0 ?, but I have no idea if it's even
expected to work. I'm going to leave this bug open until NVF0 is supported with
open firmware.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381343351.2f702.14107
Date: Wed, 9 Oct 2013 18:29:11 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVF0] Kernel/Driver fails to initialize acceleration on GTX Titan"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70326#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVF0] Kernel/Driver fails to initialize acceleration on GTX Titan"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70326">bug 70326</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>You need to mmiotrace the blob and get the graph firmware. See
<a href="http://nouveau.freedesktop.org/wiki/NVC0_Firmware/">http://nouveau.freedesktop.org/wiki/NVC0_Firmware/</a> (up to &quot;Video Firmware&quot;,
which you don't need to worry about). Once you get that, stick the files in
/lib/firmware/nouveau and boot with nouveau.config=NvGrUseFW=1,PGRAPH=1 .
Built-in firmware is being worked on, afaik, but currently incomplete. There is
preliminary support you could use if you like, see
drivers/gpu/drm/nouveau/core/engine/graph/nvf0.c:

    .fecs.ucode = 0 ? &amp;nvf0_graph_fecs_ucode : NULL,

Just change that to 1 ? instead of 0 ?, but I have no idea if it's even
expected to work. I'm going to leave this bug open until NVF0 is supported with
open firmware.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381343351.2f702.14107--

--===============0809524474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0809524474==--
