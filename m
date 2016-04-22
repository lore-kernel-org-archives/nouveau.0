From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95044] [NVA0] [Reclocking] GPU doesn't relax memory
	clocks
Date: Fri, 22 Apr 2016 20:08:08 +0000
Message-ID: <bug-95044-8800-4hLWliWbRn@http.bugs.freedesktop.org/>
References: <bug-95044-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0312365835=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95044-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0312365835==
Content-Type: multipart/alternative; boundary="14613556880.Fe6B6d4A.5992";
 charset="UTF-8"


--14613556880.Fe6B6d4A.5992
Date: Fri, 22 Apr 2016 20:08:08 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95044

--- Comment #5 from debianlinuxero1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
As karolherbst pointed on the #nouveau irc channel, I patched my distro kernel
sources with this patch : 

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/arch/x86/mm/kmmio.c?id=cfa52c0cfa4d727aa3e457bf29aeff296c528a08

Build with the same options as current kernel.

It did the trick.

I finally was able to do the mmiotrace test.

The test consisted in running the bare X server with only the nvidia-settings
application.

Forced Maximum Performance level.

At reach then forced adaptive.

At reach then exited both application and X.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14613556880.Fe6B6d4A.5992
Date: Fri, 22 Apr 2016 20:08:08 +0000
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
   title="NEW - [NVA0] [Reclocking] GPU doesn't relax memory clocks"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95044#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVA0] [Reclocking] GPU doesn't relax memory clocks"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95044">bug 95044</a>
              from <span class="vcard"><a class="email" href="mailto:debianlinuxero1&#64;gmail.com" title="debianlinuxero1&#64;gmail.com">debianlinuxero1&#64;gmail.com</a>
</span></b>
        <pre>As karolherbst pointed on the #nouveau irc channel, I patched my distro kernel
sources with this patch : 

<a href="https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/arch/x86/mm/kmmio.c?id=cfa52c0cfa4d727aa3e457bf29aeff296c528a08">https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/arch/x86/mm/kmmio.c?id=cfa52c0cfa4d727aa3e457bf29aeff296c528a08</a>

Build with the same options as current kernel.

It did the trick.

I finally was able to do the mmiotrace test.

The test consisted in running the bare X server with only the nvidia-settings
application.

Forced Maximum Performance level.

At reach then forced adaptive.

At reach then exited both application and X.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14613556880.Fe6B6d4A.5992--

--===============0312365835==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0312365835==--
