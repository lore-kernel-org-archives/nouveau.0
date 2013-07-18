From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64774] nouveau GF108 kernel crash in optimus mode
 when enabling external display output
Date: Thu, 18 Jul 2013 21:15:08 +0000
Message-ID: <bug-64774-8800-zTiOREDBOB@http.bugs.freedesktop.org/>
References: <bug-64774-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0259697504=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64774-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0259697504==
Content-Type: multipart/alternative; boundary="1374182108.B30615d2.24152"; charset="us-ascii"


--1374182108.B30615d2.24152
Date: Thu, 18 Jul 2013 21:15:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64774

--- Comment #13 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Outputs certainly *appear* to be detected. What makes you say they're not?

[    2.882654] nouveau  [     DRM] DCB outp 00: 01800323 00010034
[    2.882656] nouveau  [     DRM] DCB outp 01: 02811300 00000000
[    2.882657] nouveau  [     DRM] DCB outp 02: 028223a6 0f220010
[    2.882658] nouveau  [     DRM] DCB outp 03: 02822362 00020010
[    2.882659] nouveau  [     DRM] DCB outp 04: 048333b6 0f220010
[    2.882660] nouveau  [     DRM] DCB outp 05: 04833372 00020010
[    2.882662] nouveau  [     DRM] DCB outp 06: 088443c6 0f220010
[    2.882663] nouveau  [     DRM] DCB outp 07: 08844382 00020010
[    2.882664] nouveau  [     DRM] DCB conn 00: 00000040
[    2.882666] nouveau  [     DRM] DCB conn 01: 00000100
[    2.882667] nouveau  [     DRM] DCB conn 02: 00110246
[    2.882668] nouveau  [     DRM] DCB conn 03: 00220346
[    2.882669] nouveau  [     DRM] DCB conn 04: 01400446
[    3.023865] nouveau  [     DRM] allocated 1920x1080 fb: 0x60000, bo
ffff8803285f9c00

I assume you have a 1920x1080 screen hooked up to the DVI?

You can look at the KMS status in /sys/class/drm/ -- you should see
cardN-DVI-I-N  directories. xrandr should also provide accurate status, e.g.:

$ grep . /sys/class/drm/card*-*/status 
/sys/class/drm/card0-DVI-I-1/status:connected
/sys/class/drm/card0-DVI-I-2/status:disconnected

However it may end up being hidden due to vgaswitcheroo -- so make sure to look
into that too. (Unfortunately I know next to nothing about vgaswitcheroo, but
I'm sure Google knows more.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374182108.B30615d2.24152
Date: Thu, 18 Jul 2013 21:15:08 +0000
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
   title="NEW --- - nouveau GF108 kernel crash in optimus mode when enabling external display output"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64774#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau GF108 kernel crash in optimus mode when enabling external display output"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64774">bug 64774</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Outputs certainly *appear* to be detected. What makes you say they're not?

[    2.882654] nouveau  [     DRM] DCB outp 00: 01800323 00010034
[    2.882656] nouveau  [     DRM] DCB outp 01: 02811300 00000000
[    2.882657] nouveau  [     DRM] DCB outp 02: 028223a6 0f220010
[    2.882658] nouveau  [     DRM] DCB outp 03: 02822362 00020010
[    2.882659] nouveau  [     DRM] DCB outp 04: 048333b6 0f220010
[    2.882660] nouveau  [     DRM] DCB outp 05: 04833372 00020010
[    2.882662] nouveau  [     DRM] DCB outp 06: 088443c6 0f220010
[    2.882663] nouveau  [     DRM] DCB outp 07: 08844382 00020010
[    2.882664] nouveau  [     DRM] DCB conn 00: 00000040
[    2.882666] nouveau  [     DRM] DCB conn 01: 00000100
[    2.882667] nouveau  [     DRM] DCB conn 02: 00110246
[    2.882668] nouveau  [     DRM] DCB conn 03: 00220346
[    2.882669] nouveau  [     DRM] DCB conn 04: 01400446
[    3.023865] nouveau  [     DRM] allocated 1920x1080 fb: 0x60000, bo
ffff8803285f9c00

I assume you have a 1920x1080 screen hooked up to the DVI?

You can look at the KMS status in /sys/class/drm/ -- you should see
cardN-DVI-I-N  directories. xrandr should also provide accurate status, e.g.:

$ grep . /sys/class/drm/card*-*/status 
/sys/class/drm/card0-DVI-I-1/status:connected
/sys/class/drm/card0-DVI-I-2/status:disconnected

However it may end up being hidden due to vgaswitcheroo -- so make sure to look
into that too. (Unfortunately I know next to nothing about vgaswitcheroo, but
I'm sure Google knows more.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374182108.B30615d2.24152--

--===============0259697504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0259697504==--
