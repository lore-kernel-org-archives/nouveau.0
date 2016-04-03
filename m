From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94803] nouveau bug crashes kernel 4.4.6 on warm boot
Date: Sun, 03 Apr 2016 01:11:49 +0000
Message-ID: <bug-94803-8800-6tvCEdCEVC@http.bugs.freedesktop.org/>
References: <bug-94803-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0509422185=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94803-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0509422185==
Content-Type: multipart/alternative; boundary="14596459081.EB7cf01.29070";
 charset="UTF-8"


--14596459081.EB7cf01.29070
Date: Sun, 3 Apr 2016 01:11:48 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94803

--- Comment #3 from Michael Daum <mic.daum-Mmb7MZpHnFY@public.gmane.org> ---
The patch from Ilia prevents the kernel from crashing. Reboot does not fail any
longer. Additionally _most_ of the time both monitors come up at reboot.

But on some reboots one of the monitors stays black and the kernel logs
following error (from dmesg):

[    0.955154] nouveau 0000:01:00.0: disp: outp 04:0006:0384: link training
failed
[    0.973972] nouveau 0000:01:00.0: disp: outp 04:0006:0384: link training
failed
[    0.974279] nouveau 0000:01:00.0: disp: link_nr = 0; dpctrl: 00401101


The value of dpctrl is always the same (00401101) then.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14596459081.EB7cf01.29070
Date: Sun, 3 Apr 2016 01:11:48 +0000
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
   title="NEW - nouveau bug crashes kernel 4.4.6 on warm boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94803#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau bug crashes kernel 4.4.6 on warm boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94803">bug 94803</a>
              from <span class="vcard"><a class="email" href="mailto:mic.daum&#64;gmx.de" title="Michael Daum &lt;mic.daum&#64;gmx.de&gt;"> <span class="fn">Michael Daum</span></a>
</span></b>
        <pre>The patch from Ilia prevents the kernel from crashing. Reboot does not fail any
longer. Additionally _most_ of the time both monitors come up at reboot.

But on some reboots one of the monitors stays black and the kernel logs
following error (from dmesg):

[    0.955154] nouveau 0000:01:00.0: disp: outp 04:0006:0384: link training
failed
[    0.973972] nouveau 0000:01:00.0: disp: outp 04:0006:0384: link training
failed
[    0.974279] nouveau 0000:01:00.0: disp: link_nr = 0; dpctrl: 00401101


The value of dpctrl is always the same (00401101) then.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14596459081.EB7cf01.29070--

--===============0509422185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0509422185==--
