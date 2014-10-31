From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80675] [NVAA] Nouveau KMS framebuffer hand-over:
 no/black console on Nvidia MCP78S/C77/GeForce 8300 (10de:0848) with 32MB
 graphics RAM, X11 ok
Date: Fri, 31 Oct 2014 20:39:43 +0000
Message-ID: <bug-80675-8800-56nGGbfK73@http.bugs.freedesktop.org/>
References: <bug-80675-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1423350143=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80675-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1423350143==
Content-Type: multipart/alternative; boundary="1414787983.bDC3CBd1.5558"; charset="UTF-8"


--1414787983.bDC3CBd1.5558
Date: Fri, 31 Oct 2014 20:39:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80675

Walter Haidinger <walter.haidinger-RbZlAiThDcE@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[NVAA] Nouveau KMS          |[NVAA] Nouveau KMS
                   |framebuffer hand-over:      |framebuffer hand-over:
                   |no/black console on Nvidia  |no/black console on Nvidia
                   |MCP78S/C77/GeForce 8300     |MCP78S/C77/GeForce 8300
                   |(10de:0848), X11 ok         |(10de:0848) with 32MB
                   |                            |graphics RAM, X11 ok

--- Comment #6 from Walter Haidinger <walter.haidinger-RbZlAiThDcE@public.gmane.org> ---
Update: I got my consoles back! :-)

Fix: Increased the ivdeo RAM set in the BIOS for the video card from 32MB to
64MB.
I've also modified the title accordingly.

Before:
 nouveau  [     DRM] VRAM: 32 MiB

Now:
 nouveau  [     DRM] VRAM: 64 MiB

Before closing this bug, could you at least add a warning if someone sets the
video memory below 64MB?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1414787983.bDC3CBd1.5558
Date: Fri, 31 Oct 2014 20:39:43 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:walter.haidinger&#64;gmx.at" title="Walter Haidinger &lt;walter.haidinger&#64;gmx.at&gt;"> <span class="fn">Walter Haidinger</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVAA] Nouveau KMS framebuffer hand-over: no/black console on Nvidia MCP78S/C77/GeForce 8300 (10de:0848) with 32MB graphics RAM, X11 ok"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80675">bug 80675</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>[NVAA] Nouveau KMS framebuffer hand-over: no/black console on Nvidia MCP78S/C77/GeForce 8300 (10de:0848), X11 ok
           </td>
           <td>[NVAA] Nouveau KMS framebuffer hand-over: no/black console on Nvidia MCP78S/C77/GeForce 8300 (10de:0848) with 32MB graphics RAM, X11 ok
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVAA] Nouveau KMS framebuffer hand-over: no/black console on Nvidia MCP78S/C77/GeForce 8300 (10de:0848) with 32MB graphics RAM, X11 ok"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80675#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVAA] Nouveau KMS framebuffer hand-over: no/black console on Nvidia MCP78S/C77/GeForce 8300 (10de:0848) with 32MB graphics RAM, X11 ok"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80675">bug 80675</a>
              from <span class="vcard"><a class="email" href="mailto:walter.haidinger&#64;gmx.at" title="Walter Haidinger &lt;walter.haidinger&#64;gmx.at&gt;"> <span class="fn">Walter Haidinger</span></a>
</span></b>
        <pre>Update: I got my consoles back! :-)

Fix: Increased the ivdeo RAM set in the BIOS for the video card from 32MB to
64MB.
I've also modified the title accordingly.

Before:
 nouveau  [     DRM] VRAM: 32 MiB

Now:
 nouveau  [     DRM] VRAM: 64 MiB

Before closing this bug, could you at least add a warning if someone sets the
video memory below 64MB?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1414787983.bDC3CBd1.5558--

--===============1423350143==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1423350143==--
