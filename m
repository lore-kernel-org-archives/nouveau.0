From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94637] system crash, no messages, GT215,
 ubuntu 16.04 when running glmark2 for a few minutes.
Date: Sun, 20 Mar 2016 14:39:35 +0000
Message-ID: <bug-94637-8800-8g87rWhARP@http.bugs.freedesktop.org/>
References: <bug-94637-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1292553060=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94637-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1292553060==
Content-Type: multipart/alternative; boundary="14584847750.ddD91.21701";
 charset="UTF-8"


--14584847750.ddD91.21701
Date: Sun, 20 Mar 2016 14:39:35 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94637

--- Comment #5 from Peter Silva <peter-UmW4lSGjmaZq3vnQzO7mXA@public.gmane.org> ---
about 3.13... I noticed that stuff lying around, and purged images and
headers related to old kernel.  Reproduced problem afterward.

by the way... I it crashed just now again, I wasn´t in anything graphics
intensive, it had stayed up for about three hours, but I was just browsing,
and building the bug report (running Unity 7... the normal ubuntu desktop.)


root@alu:/alu/sdc1/home/peter# journalctl -b -1
Specifying boot ID has no effect, no persistent journal was found
root@alu:/alu/sdc1/home/peter# uname -a
Linux alu 4.4.0-14-generic #30-Ubuntu SMP Tue Mar 15 13:04:17 UTC 2016
x86_64 x86_64 x86_64 GNU/Linux
root@alu:/alu/sdc1/home/peter# dpkg -l | grep linux-image
ii  linux-image-4.4.0-14-generic                          4.4.0-14.30
                         amd64        Linux kernel image for version 4.4.0
on 64 bit x86 SMP
ii  linux-image-extra-4.4.0-14-generic                    4.4.0-14.30
                         amd64        Linux kernel extra modules for
version 4.4.0 on 64 bit x86 SMP
ii  linux-image-generic                                   4.4.0.14.15
                         amd64        Generic Linux kernel image
root@alu:/alu/sdc1/home/peter#

On Sun, Mar 20, 2016 at 10:14 AM, <bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org> wrote:

> *Comment # 4 <https://bugs.freedesktop.org/show_bug.cgi?id=94637#c4> on
> bug 94637 <https://bugs.freedesktop.org/show_bug.cgi?id=94637> from Pierre
> Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> *
>
> The dmesg you linked is *interesting*. There is no mention of Nouveau being
> loaded, and it reports a kernel version of 3.13, whereas your Xorg.log and your
> information paste mention kernel 4.4. Could you link a dmesg from 4.4 when it
> crashes? (If you have systemd on your laptop, you can get the logs from the
> previous boot by running `journalctl -b -1`.)
>
> ------------------------------
> You are receiving this mail because:
>
>    - You reported the bug.
>
>

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.
--14584847750.ddD91.21701
Date: Sun, 20 Mar 2016 14:39:35 +0000
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
   title="NEW - system crash, no messages, GT215, ubuntu 16.04 when running glmark2 for a few minutes."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94637#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - system crash, no messages, GT215, ubuntu 16.04 when running glmark2 for a few minutes."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94637">bug 94637</a>
              from <span class="vcard"><a class="email" href="mailto:peter&#64;bsqt.homeip.net" title="Peter Silva &lt;peter&#64;bsqt.homeip.net&gt;"> <span class="fn">Peter Silva</span></a>
</span></b>
        <pre>about 3.13... I noticed that stuff lying around, and purged images and
headers related to old kernel.  Reproduced problem afterward.

by the way... I it crashed just now again, I wasn´t in anything graphics
intensive, it had stayed up for about three hours, but I was just browsing,
and building the bug report (running Unity 7... the normal ubuntu desktop.)


root&#64;alu:/alu/sdc1/home/peter# journalctl -b -1
Specifying boot ID has no effect, no persistent journal was found
root&#64;alu:/alu/sdc1/home/peter# uname -a
Linux alu 4.4.0-14-generic #30-Ubuntu SMP Tue Mar 15 13:04:17 UTC 2016
x86_64 x86_64 x86_64 GNU/Linux
root&#64;alu:/alu/sdc1/home/peter# dpkg -l | grep linux-image
ii  linux-image-4.4.0-14-generic                          4.4.0-14.30
                         amd64        Linux kernel image for version 4.4.0
on 64 bit x86 SMP
ii  linux-image-extra-4.4.0-14-generic                    4.4.0-14.30
                         amd64        Linux kernel extra modules for
version 4.4.0 on 64 bit x86 SMP
ii  linux-image-generic                                   4.4.0.14.15
                         amd64        Generic Linux kernel image
root&#64;alu:/alu/sdc1/home/peter#

On Sun, Mar 20, 2016 at 10:14 AM, &lt;<a href="mailto:bugzilla-daemon&#64;freedesktop.org">bugzilla-daemon&#64;freedesktop.org</a>&gt; wrote:

<span class="quote">&gt; *<a href="show_bug.cgi?id=94637#c4">Comment # 4</a> &lt;<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - system crash, no messages, GT215, ubuntu 16.04 when running glmark2 for a few minutes."
   href="show_bug.cgi?id=94637#c4">https://bugs.freedesktop.org/show_bug.cgi?id=94637#c4</a>&gt; on
&gt; <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - system crash, no messages, GT215, ubuntu 16.04 when running glmark2 for a few minutes."
   href="show_bug.cgi?id=94637">bug 94637</a> &lt;<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - system crash, no messages, GT215, ubuntu 16.04 when running glmark2 for a few minutes."
   href="show_bug.cgi?id=94637">https://bugs.freedesktop.org/show_bug.cgi?id=94637</a>&gt; from Pierre
&gt; Moreau &lt;<a href="mailto:pierre.morrow&#64;free.fr">pierre.morrow&#64;free.fr</a>&gt; *</span >
&gt;
<span class="quote">&gt; The dmesg you linked is *interesting*. There is no mention of Nouveau being
&gt; loaded, and it reports a kernel version of 3.13, whereas your Xorg.log and your
&gt; information paste mention kernel 4.4. Could you link a dmesg from 4.4 when it
&gt; crashes? (If you have systemd on your laptop, you can get the logs from the
&gt; previous boot by running `journalctl -b -1`.)</span >
&gt;
<span class="quote">&gt; ------------------------------
&gt; You are receiving this mail because:</span >
&gt;
<span class="quote">&gt;    - You reported the bug.</span >
&gt;
&gt;</pre>
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
--14584847750.ddD91.21701--

--===============1292553060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1292553060==--
