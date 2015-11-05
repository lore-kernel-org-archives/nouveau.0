From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89912] Sometimes Nouveau hangs kernel with PGRAPH
	engine fault
Date: Thu, 05 Nov 2015 14:48:34 +0000
Message-ID: <bug-89912-8800-KNWOTH6jg8@http.bugs.freedesktop.org/>
References: <bug-89912-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1262404125=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89912-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1262404125==
Content-Type: multipart/alternative; boundary="1446734914.FeBbab8D4.19818"; charset="UTF-8"


--1446734914.FeBbab8D4.19818
Date: Thu, 5 Nov 2015 14:48:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89912

--- Comment #4 from Thiago <thiago.igarashi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Same problem here!!
Im using kernel 4.0.2-1-amd64 on Debian 


01:00.0 VGA compatible controller: NVIDIA Corporation GK106 [GeForce GTX 650
Ti] (rev a1)

/var/log/syslog

kernel: [47450.816837] nouveau E[chromium[1738]] fail set_domain
kernel: [47450.816843] nouveau E[chromium[1738]] validating bo list
kernel: [47450.816846] nouveau E[chromium[1738]] validate: -22
kernel: [47450.817278] nouveau E[chromium[1738]] fail set_domain
kernel: [47450.817281] nouveau E[chromium[1738]] validating bo list
kernel: [47450.817283] nouveau E[chromium[1738]] validate: -22
kernel: [47450.817389] nouveau E[chromium[1738]] fail set_domain
kernel: [47450.817390] nouveau E[chromium[1738]] validating bo list
kernel: [47450.817393] nouveau E[chromium[1738]] validate: -22
kernel: [47450.818377] nouveau E[chromium[1738]] fail set_domain
kernel: [47450.818380] nouveau E[chromium[1738]] validating bo list
kernel: [47450.818384] nouveau E[chromium[1738]] validate: -22
kernel: [47450.825570] nouveau E[   PFIFO][0000:01:00.0] read fault at
0x000c580000 [PTE] from GR/GPC0/PROP_0 on channel 0x003f7cf000 [chromium[1738]]
kernel: [47450.825576] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on
channel 6, recovering...

system freezes but mouse still working and clementine still playing.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1446734914.FeBbab8D4.19818
Date: Thu, 5 Nov 2015 14:48:34 +0000
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
   title="NEW - Sometimes Nouveau hangs kernel with PGRAPH engine fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89912#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Sometimes Nouveau hangs kernel with PGRAPH engine fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89912">bug 89912</a>
              from <span class="vcard"><a class="email" href="mailto:thiago.igarashi&#64;gmail.com" title="Thiago &lt;thiago.igarashi&#64;gmail.com&gt;"> <span class="fn">Thiago</span></a>
</span></b>
        <pre>Same problem here!!
Im using kernel 4.0.2-1-amd64 on Debian 


01:00.0 VGA compatible controller: NVIDIA Corporation GK106 [GeForce GTX 650
Ti] (rev a1)

/var/log/syslog

kernel: [47450.816837] nouveau E[chromium[1738]] fail set_domain
kernel: [47450.816843] nouveau E[chromium[1738]] validating bo list
kernel: [47450.816846] nouveau E[chromium[1738]] validate: -22
kernel: [47450.817278] nouveau E[chromium[1738]] fail set_domain
kernel: [47450.817281] nouveau E[chromium[1738]] validating bo list
kernel: [47450.817283] nouveau E[chromium[1738]] validate: -22
kernel: [47450.817389] nouveau E[chromium[1738]] fail set_domain
kernel: [47450.817390] nouveau E[chromium[1738]] validating bo list
kernel: [47450.817393] nouveau E[chromium[1738]] validate: -22
kernel: [47450.818377] nouveau E[chromium[1738]] fail set_domain
kernel: [47450.818380] nouveau E[chromium[1738]] validating bo list
kernel: [47450.818384] nouveau E[chromium[1738]] validate: -22
kernel: [47450.825570] nouveau E[   PFIFO][0000:01:00.0] read fault at
0x000c580000 [PTE] from GR/GPC0/PROP_0 on channel 0x003f7cf000 [chromium[1738]]
kernel: [47450.825576] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on
channel 6, recovering...

system freezes but mouse still working and clementine still playing.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1446734914.FeBbab8D4.19818--

--===============1262404125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1262404125==--
