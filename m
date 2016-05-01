From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95213] no screens found(EE)
Date: Sun, 01 May 2016 16:46:10 +0000
Message-ID: <bug-95213-8800-nqtsUxifLK@http.bugs.freedesktop.org/>
References: <bug-95213-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0220818034=="
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


--===============0220818034==
Content-Type: multipart/alternative; boundary="14621211700.9d76.22898";
 charset="UTF-8"


--14621211700.9d76.22898
Date: Sun, 1 May 2016 16:46:10 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95213

--- Comment #2 from tele <swojskichlopak-5tc4TXWwyLM@public.gmane.org> ---
Example from Intel graphic card which working:
    end of dmesh log
#-------------------------------
 . . .
[    0.000000] input: Video Bus as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input18
[    0.000000] [drm] Initialized i915 1.6.0 20151010 for 0000:00:02.0 on minor
0
[    0.000000] fbcon: inteldrmfb (fb0) is primary device
[    0.000000] Console: switching to colour frame buffer device 240x67
[    0.000000] i915 0000:00:02.0: fb0: inteldrmfb frame buffer device
[    0.000000] [drm:intel_set_pch_fifo_underrun_reporting [i915]] *ERROR*
uncleared pch fifo underrun on pch transcoder A
[    0.000000] [drm:cpt_irq_handler [i915]] *ERROR* PCH transcoder A FIFO
underrun
[    0.000000] ip_set: protocol 6
[    0.000000] netfilter PSD loaded - (c) astaro AG
[    0.000000] IFWLOG: register target
 . . .
#-------------------------------

#------------------------
$ lsmod
. . .
i915                  890176  3 
drm_kms_helper         79844  1 i915
drm                   232046  5 i915,drm_kms_helper
video                  24297  1 i915
. . .
#------------------------

checking
#-----------------------------------------------
$ modinfo i915
filename:      
/lib/modules/4.4.6-pclos1/kernel/drivers/gpu/drm/i915/i915.ko.xz
. . .
$ modinfo nouveau
filename:      
/lib/modules/4.4.6-pclos1/kernel/drivers/gpu/drm/nouveau/nouveau.ko.xz
. . .
#-----------------------------------------------

 Configuration:
#--------------------------------------
$ modprobe -c  | grep nouveau
alias pci:v000010DEd*sv*sd*bc03sc*i* nouveau
alias pci:v000012D2d*sv*sd*bc03sc*i* nouveau
#--------------------------------------

Blacklisted and disabled modules
#-----------------------------
$ modprobe --showconfig | egrep "^(blacklist|install)" | grep nouveau
$ 
#-----------------------------

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.
--14621211700.9d76.22898
Date: Sun, 1 May 2016 16:46:10 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95213#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - no screens found(EE)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95213">bug 95213</a>
              from <span class="vcard"><a class="email" href="mailto:swojskichlopak&#64;wp.pl" title="tele &lt;swojskichlopak&#64;wp.pl&gt;"> <span class="fn">tele</span></a>
</span></b>
        <pre>Example from Intel graphic card which working:
    end of dmesh log
#-------------------------------
 . . .
[    0.000000] input: Video Bus as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input18
[    0.000000] [drm] Initialized i915 1.6.0 20151010 for 0000:00:02.0 on minor
0
[    0.000000] fbcon: inteldrmfb (fb0) is primary device
[    0.000000] Console: switching to colour frame buffer device 240x67
[    0.000000] i915 0000:00:02.0: fb0: inteldrmfb frame buffer device
[    0.000000] [drm:intel_set_pch_fifo_underrun_reporting [i915]] *ERROR*
uncleared pch fifo underrun on pch transcoder A
[    0.000000] [drm:cpt_irq_handler [i915]] *ERROR* PCH transcoder A FIFO
underrun
[    0.000000] ip_set: protocol 6
[    0.000000] netfilter PSD loaded - (c) astaro AG
[    0.000000] IFWLOG: register target
 . . .
#-------------------------------

#------------------------
$ lsmod
. . .
i915                  890176  3 
drm_kms_helper         79844  1 i915
drm                   232046  5 i915,drm_kms_helper
video                  24297  1 i915
. . .
#------------------------

checking
#-----------------------------------------------
$ modinfo i915
filename:      
/lib/modules/4.4.6-pclos1/kernel/drivers/gpu/drm/i915/i915.ko.xz
. . .
$ modinfo nouveau
filename:      
/lib/modules/4.4.6-pclos1/kernel/drivers/gpu/drm/nouveau/nouveau.ko.xz
. . .
#-----------------------------------------------

 Configuration:
#--------------------------------------
$ modprobe -c  | grep nouveau
alias pci:v000010DEd*sv*sd*bc03sc*i* nouveau
alias pci:v000012D2d*sv*sd*bc03sc*i* nouveau
#--------------------------------------

Blacklisted and disabled modules
#-----------------------------
$ modprobe --showconfig | egrep &quot;^(blacklist|install)&quot; | grep nouveau
$ 
#-----------------------------</pre>
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
--14621211700.9d76.22898--

--===============0220818034==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0220818034==--
