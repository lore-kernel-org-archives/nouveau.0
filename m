From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85471] [NV86] nouveau/kernel 3.18.0-rc1: nouveau
 deadlocks on 2nd Xorg start or reboot
Date: Sun, 26 Oct 2014 09:53:52 +0000
Message-ID: <bug-85471-8800-FNb8O0I5iP@http.bugs.freedesktop.org/>
References: <bug-85471-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0952586126=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-85471-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0952586126==
Content-Type: multipart/alternative; boundary="1414317232.F2ea7Fe1.6372"; charset="UTF-8"


--1414317232.F2ea7Fe1.6372
Date: Sun, 26 Oct 2014 09:53:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85471

--- Comment #3 from Christian Vogel <vogelchr-InfKab39H3A@public.gmane.org> ---
Created attachment 108440
  --> https://bugs.freedesktop.org/attachment.cgi?id=108440&action=edit
Disassembly of nouveau_pmops_runtime_suspend

As the only nouveau-specific thing in the kernel-stack-trace seems to be
nouveau_pmops_runtime_suspend, I'm adding a disassembly.

Unfortunately the two calls to pm_runtime_forbid() can't even be distinguished,
as there's only one call, and the 2nd one is optimized by gcc to a branch
upwards, I've marked the actual location from the stacktrace with #####.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1414317232.F2ea7Fe1.6372
Date: Sun, 26 Oct 2014 09:53:52 +0000
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
   title="NEW - [NV86] nouveau/kernel 3.18.0-rc1: nouveau deadlocks on 2nd Xorg start or reboot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85471#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV86] nouveau/kernel 3.18.0-rc1: nouveau deadlocks on 2nd Xorg start or reboot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85471">bug 85471</a>
              from <span class="vcard"><a class="email" href="mailto:vogelchr&#64;vogel.cx" title="Christian Vogel &lt;vogelchr&#64;vogel.cx&gt;"> <span class="fn">Christian Vogel</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=108440" name="attach_108440" title="Disassembly of nouveau_pmops_runtime_suspend">attachment 108440</a> <a href="attachment.cgi?id=108440&amp;action=edit" title="Disassembly of nouveau_pmops_runtime_suspend">[details]</a></span>
Disassembly of nouveau_pmops_runtime_suspend

As the only nouveau-specific thing in the kernel-stack-trace seems to be
nouveau_pmops_runtime_suspend, I'm adding a disassembly.

Unfortunately the two calls to pm_runtime_forbid() can't even be distinguished,
as there's only one call, and the 2nd one is optimized by gcc to a branch
upwards, I've marked the actual location from the stacktrace with #####.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1414317232.F2ea7Fe1.6372--

--===============0952586126==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0952586126==--
