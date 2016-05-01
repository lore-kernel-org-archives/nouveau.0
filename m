From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95213] no screens found(EE)
Date: Sun, 01 May 2016 17:31:44 +0000
Message-ID: <bug-95213-8800-KpdqjQiF2W@http.bugs.freedesktop.org/>
References: <bug-95213-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0387342104=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95213-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0387342104==
Content-Type: multipart/alternative; boundary="14621239030.DA2c.10703";
 charset="UTF-8"


--14621239030.DA2c.10703
Date: Sun, 1 May 2016 17:31:43 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95213

--- Comment #4 from tele <swojskichlopak-5tc4TXWwyLM@public.gmane.org> ---

   nouveau
#-----------------------------
$ dmesg
. . .
[   28.809515] fuse init (API version 7.23)
[   28.885150] input: PC Speaker as /devices/platform/pcspkr/input/input16
[   28.956544] loop: module loaded
[   29.054695] device-mapper: uevent: version 1.0.3
[   29.054821] device-mapper: ioctl: 4.34.0-ioctl (2015-10-28) initialised:
dm-devel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
[   29.806268] EXT4-fs (sda7): re-mounted. Opts: (null)
  <--- THE END HERE
#-----------------------------

   intel
#---------------------
$ dmesg
. . .
[    0.000000] fuse init (API version 7.23)
[    0.000000] input: PC Speaker as /devices/platform/pcspkr/input/input17
[    0.000000] loop: module loaded
[    0.000000] device-mapper: uevent: version 1.0.3
[    0.000000] device-mapper: ioctl: 4.34.0-ioctl (2015-10-28) initialised:
dm-devel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
[    0.000000] EXT4-fs (sda7): re-mounted. Opts: (null)
[    0.000000] multipathd (2308): /proc/2308/oom_adj is deprecated, please use
/proc/2308/oom_score_adj instead.
[    0.000000] device-mapper: multipath: version 1.10.0 loaded
[    0.000000] device-mapper: multipath round-robin: version 1.0.0 loaded
[    0.000000] device-mapper: table: 253:1: multipath: error getting device
[    0.000000] device-mapper: ioctl: error adding target to table
[    0.000000] vboxdrv: Found 4 processor cores
. . . GOES FURTHER 
#---------------------

-- 
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.
--14621239030.DA2c.10703
Date: Sun, 1 May 2016 17:31:43 +0000
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
   title="NEW - no screens found(EE)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95213#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - no screens found(EE)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95213">bug 95213</a>
              from <span class="vcard"><a class="email" href="mailto:swojskichlopak&#64;wp.pl" title="tele &lt;swojskichlopak&#64;wp.pl&gt;"> <span class="fn">tele</span></a>
</span></b>
        <pre>
   nouveau
#-----------------------------
$ dmesg
. . .
[   28.809515] fuse init (API version 7.23)
[   28.885150] input: PC Speaker as /devices/platform/pcspkr/input/input16
[   28.956544] loop: module loaded
[   29.054695] device-mapper: uevent: version 1.0.3
[   29.054821] device-mapper: ioctl: 4.34.0-ioctl (2015-10-28) initialised:
<a href="mailto:dm-devel&#64;redhat.com">dm-devel&#64;redhat.com</a>
[   29.806268] EXT4-fs (sda7): re-mounted. Opts: (null)
  &lt;--- THE END HERE
#-----------------------------

   intel
#---------------------
$ dmesg
. . .
[    0.000000] fuse init (API version 7.23)
[    0.000000] input: PC Speaker as /devices/platform/pcspkr/input/input17
[    0.000000] loop: module loaded
[    0.000000] device-mapper: uevent: version 1.0.3
[    0.000000] device-mapper: ioctl: 4.34.0-ioctl (2015-10-28) initialised:
<a href="mailto:dm-devel&#64;redhat.com">dm-devel&#64;redhat.com</a>
[    0.000000] EXT4-fs (sda7): re-mounted. Opts: (null)
[    0.000000] multipathd (2308): /proc/2308/oom_adj is deprecated, please use
/proc/2308/oom_score_adj instead.
[    0.000000] device-mapper: multipath: version 1.10.0 loaded
[    0.000000] device-mapper: multipath round-robin: version 1.0.0 loaded
[    0.000000] device-mapper: table: 253:1: multipath: error getting device
[    0.000000] device-mapper: ioctl: error adding target to table
[    0.000000] vboxdrv: Found 4 processor cores
. . . GOES FURTHER 
#---------------------</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>
--14621239030.DA2c.10703--

--===============0387342104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0387342104==--
