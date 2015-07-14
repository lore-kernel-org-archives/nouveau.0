From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91333] Connecting second of two monitors to a Lenovo
 W520 causes displays to go crazy
Date: Tue, 14 Jul 2015 04:16:36 +0000
Message-ID: <bug-91333-8800-LYV0lxfyza@http.bugs.freedesktop.org/>
References: <bug-91333-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0083861007=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91333-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0083861007==
Content-Type: multipart/alternative; boundary="1436847396.Bba281.24124"; charset="UTF-8"


--1436847396.Bba281.24124
Date: Tue, 14 Jul 2015 04:16:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91333

--- Comment #7 from Corey Ashford <cjashfor-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org> ---
In both of these log files is a line like the following:

 48.693955] nouveau E[   PDISP][0000:01:00.0] INVALID_STATE [UNK05] chid 0 mthd
0x0080 data 0x00000000

Followed by a dump of what appears to be internal Nouveau driver state:

[   48.693960] nouveau E[   PDISP][0000:01:00.0] Core:
[   48.693966] nouveau E[   PDISP][0000:01:00.0]     0x0084: 0x019e02e2 ->
0x00000000
[   48.693972] nouveau E[   PDISP][0000:01:00.0]     0x0088: 0xf0000000         
[   48.693973] nouveau E[   PDISP][0000:01:00.0] Core - DAC 0:
[   48.693978] nouveau E[   PDISP][0000:01:00.0]     0x0400: 0x00000000         
[   48.693984] nouveau E[   PDISP][0000:01:00.0]     0x0404: 0x00000000         
[   48.693989] nouveau E[   PDISP][0000:01:00.0]     0x0420: 0x00010000         
[   48.693990] nouveau E[   PDISP][0000:01:00.0] Core - DAC 1:
[   48.693995] nouveau E[   PDISP][0000:01:00.0]     0x0480: 0x00000000         


Is this normal behavior?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1436847396.Bba281.24124
Date: Tue, 14 Jul 2015 04:16:36 +0000
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
   title="NEW - Connecting second of two monitors to a Lenovo W520 causes displays to go crazy"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91333#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Connecting second of two monitors to a Lenovo W520 causes displays to go crazy"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91333">bug 91333</a>
              from <span class="vcard"><a class="email" href="mailto:cjashfor&#64;us.ibm.com" title="Corey Ashford &lt;cjashfor&#64;us.ibm.com&gt;"> <span class="fn">Corey Ashford</span></a>
</span></b>
        <pre>In both of these log files is a line like the following:

 48.693955] nouveau E[   PDISP][0000:01:00.0] INVALID_STATE [UNK05] chid 0 mthd
0x0080 data 0x00000000

Followed by a dump of what appears to be internal Nouveau driver state:

[   48.693960] nouveau E[   PDISP][0000:01:00.0] Core:
[   48.693966] nouveau E[   PDISP][0000:01:00.0]     0x0084: 0x019e02e2 -&gt;
0x00000000
[   48.693972] nouveau E[   PDISP][0000:01:00.0]     0x0088: 0xf0000000         
[   48.693973] nouveau E[   PDISP][0000:01:00.0] Core - DAC 0:
[   48.693978] nouveau E[   PDISP][0000:01:00.0]     0x0400: 0x00000000         
[   48.693984] nouveau E[   PDISP][0000:01:00.0]     0x0404: 0x00000000         
[   48.693989] nouveau E[   PDISP][0000:01:00.0]     0x0420: 0x00010000         
[   48.693990] nouveau E[   PDISP][0000:01:00.0] Core - DAC 1:
[   48.693995] nouveau E[   PDISP][0000:01:00.0]     0x0480: 0x00000000         


Is this normal behavior?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1436847396.Bba281.24124--

--===============0083861007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0083861007==--
