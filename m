From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82714] [G84] nouveau fails to properly initialize GPU
Date: Fri, 15 Apr 2016 09:34:23 +0000
Message-ID: <bug-82714-8800-y1LOh2C1HA@http.bugs.freedesktop.org/>
References: <bug-82714-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1238516649=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82714-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1238516649==
Content-Type: multipart/alternative; boundary="14607128632.5aAfeEFC.27719";
 charset="UTF-8"


--14607128632.5aAfeEFC.27719
Date: Fri, 15 Apr 2016 09:34:23 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=82714

--- Comment #21 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
I tested with latest Nouveau and latest drm-next as of yesterday (4.6-rcX),
with the G84 alongside a GM206; the GM206 was the one driving the screen.
Launching weston or kmscon works, but starting X makes the whole computer
freeze (no responce on key presses, power button press, capslock not working).
I’ll try to setup netconsole and SSH later to gather some logs.

On one of the boots, I got a slow path warning in
nvkm_pci_intr()/nvkm_mc_intr().

Trying to suspend the computer simply results in the computer not suspending
and freezing.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14607128632.5aAfeEFC.27719
Date: Fri, 15 Apr 2016 09:34:23 +0000
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
   title="NEW - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714">bug 82714</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>I tested with latest Nouveau and latest drm-next as of yesterday (4.6-rcX),
with the G84 alongside a GM206; the GM206 was the one driving the screen.
Launching weston or kmscon works, but starting X makes the whole computer
freeze (no responce on key presses, power button press, capslock not working).
I’ll try to setup netconsole and SSH later to gather some logs.

On one of the boots, I got a slow path warning in
nvkm_pci_intr()/nvkm_mc_intr().

Trying to suspend the computer simply results in the computer not suspending
and freezing.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14607128632.5aAfeEFC.27719--

--===============1238516649==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1238516649==--
