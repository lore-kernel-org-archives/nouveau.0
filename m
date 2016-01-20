From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93629] [NVE6] complete system freeze,
 PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]
Date: Wed, 20 Jan 2016 19:25:07 +0000
Message-ID: <bug-93629-8800-bVPoUWW5FD@http.bugs.freedesktop.org/>
References: <bug-93629-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0007326401=="
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


--===============0007326401==
Content-Type: multipart/alternative; boundary="14533179071.7d49d957.12996";
 charset="UTF-8"


--14533179071.7d49d957.12996
Date: Wed, 20 Jan 2016 19:25:07 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93629

--- Comment #11 from Matthias Nagel <matthias.h.nagel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Ok. Let's restate it in my own words to make sure I understood you correctly.

But first, let me say that I already have tried 4.4.0 without proprietary
firmware. To this end I omitted nouveau.config="NvGrUseFw=1". I experienced the
same crash with freeze while scrolling a LibreOffice Writer document. So bad
news the bug is still there.

Now, I wanted to check if 4.4.0 with proprietary firmware works without
crashing. For this purpose you want me to rename

nouveau/fuc409c -> nvidia/fecs_inst
nouveau/fuc409d -> nvidia/fecs_data
nouveau/fuc41ac -> nvidia/gpccs_inst
nouveau/fuc41ad -> nvidia/gpccs_data

These are essentially the same files but with a different path and name. Then I
change

CONFIG_CMDLINE="nouveau.config=\"NvGrUseFw=1\""
CONFIG_FIRMWARE_IN_KERNEL=y
CONFIG_EXTRA_FIRMWARE="nvidia/fecs_inst nvidia/fecs_data nvidia/gpccs_inst
nvidia/gpccs_data"
CONFIG_EXTRA_FIRMWARE_DIR="firmware"

After re-compilation I should have a new kernel that uses the proprietary fw
and I should be able to check if the crash with freeze is still there or not.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14533179071.7d49d957.12996
Date: Wed, 20 Jan 2016 19:25:07 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93629#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] complete system freeze, PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93629">bug 93629</a>
              from <span class="vcard"><a class="email" href="mailto:matthias.h.nagel&#64;gmail.com" title="Matthias Nagel &lt;matthias.h.nagel&#64;gmail.com&gt;"> <span class="fn">Matthias Nagel</span></a>
</span></b>
        <pre>Ok. Let's restate it in my own words to make sure I understood you correctly.

But first, let me say that I already have tried 4.4.0 without proprietary
firmware. To this end I omitted nouveau.config=&quot;NvGrUseFw=1&quot;. I experienced the
same crash with freeze while scrolling a LibreOffice Writer document. So bad
news the bug is still there.

Now, I wanted to check if 4.4.0 with proprietary firmware works without
crashing. For this purpose you want me to rename

nouveau/fuc409c -&gt; nvidia/fecs_inst
nouveau/fuc409d -&gt; nvidia/fecs_data
nouveau/fuc41ac -&gt; nvidia/gpccs_inst
nouveau/fuc41ad -&gt; nvidia/gpccs_data

These are essentially the same files but with a different path and name. Then I
change

CONFIG_CMDLINE=&quot;nouveau.config=\&quot;NvGrUseFw=1\&quot;&quot;
CONFIG_FIRMWARE_IN_KERNEL=y
CONFIG_EXTRA_FIRMWARE=&quot;nvidia/fecs_inst nvidia/fecs_data nvidia/gpccs_inst
nvidia/gpccs_data&quot;
CONFIG_EXTRA_FIRMWARE_DIR=&quot;firmware&quot;

After re-compilation I should have a new kernel that uses the proprietary fw
and I should be able to check if the crash with freeze is still there or not.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14533179071.7d49d957.12996--

--===============0007326401==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0007326401==--
