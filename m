From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95190] Tomb Raider with PostProcessing enable and
 Depth of Field set to Ultra has white stuff in the foreground
Date: Thu, 28 Apr 2016 21:50:30 +0000
Message-ID: <bug-95190-8800-jXqaZDpjQb@http.bugs.freedesktop.org/>
References: <bug-95190-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0436508277=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95190-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0436508277==
Content-Type: multipart/alternative; boundary="14618802300.fEe6E.13034";
 charset="UTF-8"


--14618802300.fEe6E.13034
Date: Thu, 28 Apr 2016 21:50:30 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95190

--- Comment #1 from Luzipher <luziphermcleod-CVfgzVlYcRg@public.gmane.org> ---
Created attachment 123330
  --> https://bugs.freedesktop.org/attachment.cgi?id=123330&action=edit
Tomb Raider ultimate settings on radeonsi (r9 290x) just after applying
graphics settings (menu still open)

This also affects radeonsi, see attached image. Just after setting graphics to
ultimate it all turns white. "MESA_GL_VERSION_OVERRIDE=4.3
MESA_GLSL_VERSION_OVERRIDE=430" has no effect. Switching "Depth of Field" to
normal helps (Post Processing still switched on).

Mesa and LLVM version: current git (28.04.2016)
GPU: R9 290x
Kernel Driver: radeon (not amdgpu)

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.
--14618802300.fEe6E.13034
Date: Thu, 28 Apr 2016 21:50:30 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Tomb Raider with PostProcessing enable and Depth of Field set to Ultra has white stuff in the foreground"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95190#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Tomb Raider with PostProcessing enable and Depth of Field set to Ultra has white stuff in the foreground"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95190">bug 95190</a>
              from <span class="vcard"><a class="email" href="mailto:luziphermcleod&#64;yahoo.ie" title="Luzipher &lt;luziphermcleod&#64;yahoo.ie&gt;"> <span class="fn">Luzipher</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=123330" name="attach_123330" title="Tomb Raider ultimate settings on radeonsi (r9 290x) just after applying graphics settings (menu still open)">attachment 123330</a> <a href="attachment.cgi?id=123330&amp;action=edit" title="Tomb Raider ultimate settings on radeonsi (r9 290x) just after applying graphics settings (menu still open)">[details]</a></span>
Tomb Raider ultimate settings on radeonsi (r9 290x) just after applying
graphics settings (menu still open)

This also affects radeonsi, see attached image. Just after setting graphics to
ultimate it all turns white. &quot;MESA_GL_VERSION_OVERRIDE=4.3
MESA_GLSL_VERSION_OVERRIDE=430&quot; has no effect. Switching &quot;Depth of Field&quot; to
normal helps (Post Processing still switched on).

Mesa and LLVM version: current git (28.04.2016)
GPU: R9 290x
Kernel Driver: radeon (not amdgpu)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14618802300.fEe6E.13034--

--===============0436508277==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0436508277==--
