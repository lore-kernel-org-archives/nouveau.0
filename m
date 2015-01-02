From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87983] [NV86] GPU hangs on start,
	disabling MSI fixes it
Date: Fri, 02 Jan 2015 22:57:08 +0000
Message-ID: <bug-87983-8800-Krh1d8XEvz@http.bugs.freedesktop.org/>
References: <bug-87983-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1079453250=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87983-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1079453250==
Content-Type: multipart/alternative; boundary="1420239428.b0B1eEe41.10768"; charset="UTF-8"


--1420239428.b0B1eEe41.10768
Date: Fri, 2 Jan 2015 22:57:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87983

--- Comment #8 from bofh666-RbZlAiThDcE@public.gmane.org ---
>lspci -vnn-t

-+-[0000:80]---01.0  VIA Technologies, Inc. VT8237A/VT8251 HDA Controller
[1106:3288]
 \-[0000:00]-+-00.0  VIA Technologies, Inc. P4M890 Host Bridge [1106:0327]
             +-00.1  VIA Technologies, Inc. P4M890 Host Bridge [1106:1327]
             +-00.2  VIA Technologies, Inc. P4M890 Host Bridge [1106:2327]
             +-00.3  VIA Technologies, Inc. P4M890 Host Bridge [1106:3327]
             +-00.4  VIA Technologies, Inc. P4M890 Host Bridge [1106:4327]
             +-00.5  VIA Technologies, Inc. P4M890 I/O APIC Interrupt
Controller [1106:5327]
             +-00.6  VIA Technologies, Inc. P4M890 Security Device [1106:6327]
             +-00.7  VIA Technologies, Inc. P4M890 Host Bridge [1106:7327]
             +-01.0-[01]--
             +-02.0-[02]----00.0  NVIDIA Corporation G86 [GeForce 8500 GT]
[10de:0421]
             +-03.0-[03]--
             +-0f.0  VIA Technologies, Inc. VT8237A SATA 2-Port Controller
[1106:0591]
             +-0f.1  VIA Technologies, Inc. VT82C586A/B/VT82C686/A/B/VT823x/A/C
PIPC Bus Master IDE [1106:0571]
             +-10.0  VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller
[1106:3038]
             +-10.1  VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller
[1106:3038]
             +-10.2  VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller
[1106:3038]
             +-10.3  VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller
[1106:3038]
             +-10.4  VIA Technologies, Inc. USB 2.0 [1106:3104]
             +-11.0  VIA Technologies, Inc. VT8237A PCI to ISA Bridge
[1106:3337]
             +-11.7  VIA Technologies, Inc. VT8237/8251 Ultra VLINK Controller
[1106:287e]
             +-12.0  VIA Technologies, Inc. VT6102 [Rhine-II] [1106:3065]
             \-13.0  VIA Technologies, Inc. VT8237A Host Bridge [1106:337b]
l

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1420239428.b0B1eEe41.10768
Date: Fri, 2 Jan 2015 22:57:08 +0000
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
   title="NEW - [NV86] GPU hangs on start, disabling MSI fixes it"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87983#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV86] GPU hangs on start, disabling MSI fixes it"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87983">bug 87983</a>
              from <span class="vcard"><a class="email" href="mailto:bofh666&#64;gmx.at" title="bofh666&#64;gmx.at">bofh666&#64;gmx.at</a>
</span></b>
        <pre><span class="quote">&gt;lspci -vnn-t</span >

-+-[0000:80]---01.0  VIA Technologies, Inc. VT8237A/VT8251 HDA Controller
[1106:3288]
 \-[0000:00]-+-00.0  VIA Technologies, Inc. P4M890 Host Bridge [1106:0327]
             +-00.1  VIA Technologies, Inc. P4M890 Host Bridge [1106:1327]
             +-00.2  VIA Technologies, Inc. P4M890 Host Bridge [1106:2327]
             +-00.3  VIA Technologies, Inc. P4M890 Host Bridge [1106:3327]
             +-00.4  VIA Technologies, Inc. P4M890 Host Bridge [1106:4327]
             +-00.5  VIA Technologies, Inc. P4M890 I/O APIC Interrupt
Controller [1106:5327]
             +-00.6  VIA Technologies, Inc. P4M890 Security Device [1106:6327]
             +-00.7  VIA Technologies, Inc. P4M890 Host Bridge [1106:7327]
             +-01.0-[01]--
             +-02.0-[02]----00.0  NVIDIA Corporation G86 [GeForce 8500 GT]
[10de:0421]
             +-03.0-[03]--
             +-0f.0  VIA Technologies, Inc. VT8237A SATA 2-Port Controller
[1106:0591]
             +-0f.1  VIA Technologies, Inc. VT82C586A/B/VT82C686/A/B/VT823x/A/C
PIPC Bus Master IDE [1106:0571]
             +-10.0  VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller
[1106:3038]
             +-10.1  VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller
[1106:3038]
             +-10.2  VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller
[1106:3038]
             +-10.3  VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller
[1106:3038]
             +-10.4  VIA Technologies, Inc. USB 2.0 [1106:3104]
             +-11.0  VIA Technologies, Inc. VT8237A PCI to ISA Bridge
[1106:3337]
             +-11.7  VIA Technologies, Inc. VT8237/8251 Ultra VLINK Controller
[1106:287e]
             +-12.0  VIA Technologies, Inc. VT6102 [Rhine-II] [1106:3065]
             \-13.0  VIA Technologies, Inc. VT8237A Host Bridge [1106:337b]
l</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1420239428.b0B1eEe41.10768--

--===============1079453250==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1079453250==--
