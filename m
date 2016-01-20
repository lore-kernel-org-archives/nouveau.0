From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93629] [NVE6] complete system freeze,
 PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]
Date: Wed, 20 Jan 2016 19:09:21 +0000
Message-ID: <bug-93629-8800-X3l9uUgHFg@http.bugs.freedesktop.org/>
References: <bug-93629-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0761804507=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93629-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0761804507==
Content-Type: multipart/alternative; boundary="14533169610.24dF27A.8143";
 charset="UTF-8"


--14533169610.24dF27A.8143
Date: Wed, 20 Jan 2016 19:09:21 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93629

--- Comment #8 from Matthias Nagel <matthias.h.nagel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Today, I finally managed to give kernel 4.4.0 a try. When I try to use the
proprietary firmware I get to following boot error

Jan 20 20:01:44 kernel: nouveau 0000:01:00.0: Direct firmware load for
nvidia/gk106/fecs_inst.bin failed with error -2
Jan 20 20:01:44 kernel: nouveau 0000:01:00.0: gr: failed to load fecs_inst

Where do I get this firmware from? Until now (<4.4.0) I used the following
kernel parameters

CONFIG_CMDLINE="nouveau.config=\"NvGrUseFw=1\""
CONFIG_FIRMWARE_IN_KERNEL=y
CONFIG_EXTRA_FIRMWARE="nouveau/nve6_fuc409c nouveau/nve6_fuc409d
nouveau/nve6_fuc41ac nouveau/nve6_fuc41ad"
CONFIG_EXTRA_FIRMWARE_DIR="firmware"

and used the firmware found in bug 72180 in attachment
https://bugs.freedesktop.org/attachment.cgi?id=90180

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14533169610.24dF27A.8143
Date: Wed, 20 Jan 2016 19:09:21 +0000
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
   title="NEW - [NVE6] complete system freeze, PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93629#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] complete system freeze, PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93629">bug 93629</a>
              from <span class="vcard"><a class="email" href="mailto:matthias.h.nagel&#64;gmail.com" title="Matthias Nagel &lt;matthias.h.nagel&#64;gmail.com&gt;"> <span class="fn">Matthias Nagel</span></a>
</span></b>
        <pre>Today, I finally managed to give kernel 4.4.0 a try. When I try to use the
proprietary firmware I get to following boot error

Jan 20 20:01:44 kernel: nouveau 0000:01:00.0: Direct firmware load for
nvidia/gk106/fecs_inst.bin failed with error -2
Jan 20 20:01:44 kernel: nouveau 0000:01:00.0: gr: failed to load fecs_inst

Where do I get this firmware from? Until now (&lt;4.4.0) I used the following
kernel parameters

CONFIG_CMDLINE=&quot;nouveau.config=\&quot;NvGrUseFw=1\&quot;&quot;
CONFIG_FIRMWARE_IN_KERNEL=y
CONFIG_EXTRA_FIRMWARE=&quot;nouveau/nve6_fuc409c nouveau/nve6_fuc409d
nouveau/nve6_fuc41ac nouveau/nve6_fuc41ad&quot;
CONFIG_EXTRA_FIRMWARE_DIR=&quot;firmware&quot;

and used the firmware found in <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED INVALID - [NVE6] Random GPU Lockups, works with blob PGRAPH fw"
   href="show_bug.cgi?id=72180">bug 72180</a> in attachment
<a href="https://bugs.freedesktop.org/attachment.cgi?id=90180">https://bugs.freedesktop.org/attachment.cgi?id=90180</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14533169610.24dF27A.8143--

--===============0761804507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0761804507==--
