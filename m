From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60772] xf86-video-nouveau fails to modprobe nouveau:
 KMS not enabled
Date: Mon, 18 Feb 2013 10:37:27 +0000
Message-ID: <bug-60772-8800-mT1tos899m@http.bugs.freedesktop.org/>
References: <bug-60772-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1839160478=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60772-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1839160478==
Content-Type: multipart/alternative; boundary="1361183847.477eAC1.17581"; charset="us-ascii"


--1361183847.477eAC1.17581
Date: Mon, 18 Feb 2013 10:37:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60772

--- Comment #4 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
This case reminds me XKCD's "Workflow" [1]

Please note that KMS is not only about "shiny boot splash". Here is a snippet
from Arch's Wiki [2]

"...
Kernel Mode Setting (KMS) is a method for setting display resolution and depth
in the kernel space rather than user space.
...
even kernel space power-saving.
..."

Not to mention that there were(are) a few cases where the handover
(vga->nouveau) was causing issues. With that said I believe that udev(or
similar in your case/distro) should kick in and load nouveau before X

Personally I do not feel to strong either way, thus it may boil down to
convincing the maintainer that "nouveau kernel module should not be loaded
before X" :) . In which case this patch will be committed

[1] http://xkcd.com/1172/
[2] https://wiki.archlinux.org/index.php/Kernel_Mode_Setting

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361183847.477eAC1.17581
Date: Mon, 18 Feb 2013 10:37:27 +0000
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
   title="NEW --- - xf86-video-nouveau fails to modprobe nouveau: KMS not enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60772#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - xf86-video-nouveau fails to modprobe nouveau: KMS not enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60772">bug 60772</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>This case reminds me XKCD's &quot;Workflow&quot; [1]

Please note that KMS is not only about &quot;shiny boot splash&quot;. Here is a snippet
from Arch's Wiki [2]

&quot;...
Kernel Mode Setting (KMS) is a method for setting display resolution and depth
in the kernel space rather than user space.
...
even kernel space power-saving.
...&quot;

Not to mention that there were(are) a few cases where the handover
(vga-&gt;nouveau) was causing issues. With that said I believe that udev(or
similar in your case/distro) should kick in and load nouveau before X

Personally I do not feel to strong either way, thus it may boil down to
convincing the maintainer that &quot;nouveau kernel module should not be loaded
before X&quot; :) . In which case this patch will be committed

[1] <a href="http://xkcd.com/1172/">http://xkcd.com/1172/</a>
[2] <a href="https://wiki.archlinux.org/index.php/Kernel_Mode_Setting">https://wiki.archlinux.org/index.php/Kernel_Mode_Setting</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361183847.477eAC1.17581--

--===============1839160478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1839160478==--
