From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87436] INVALID_STATE [UNK05] chid 0 mthd 0x0080 data
	0x00000000
Date: Thu, 18 Dec 2014 11:39:47 +0000
Message-ID: <bug-87436-8800-qsI2yMHG6H@http.bugs.freedesktop.org/>
References: <bug-87436-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0913860324=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87436-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0913860324==
Content-Type: multipart/alternative; boundary="1418902786.8aAC2.4708"; charset="UTF-8"


--1418902786.8aAC2.4708
Date: Thu, 18 Dec 2014 11:39:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87436

--- Comment #3 from Roy <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org> ---
(In reply to Laurent Bigonville from comment #2)
> Created attachment 110979 [details]
> full dmesg

Unfortunately the start of the log (containing, amongst others, the full kernel
version and kernel parameters) have fallen off. Could you paste them as well
please?

One thing I did notice is that, other than for bug #84203, you were not
attempting to resume from suspend when the error occured. What was the action
you performed about 45 minutes after boot? Did you plug in a monitor, or
disable one, or change your resolution?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1418902786.8aAC2.4708
Date: Thu, 18 Dec 2014 11:39:46 +0000
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
   title="NEW - INVALID_STATE [UNK05] chid 0 mthd 0x0080 data 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87436#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - INVALID_STATE [UNK05] chid 0 mthd 0x0080 data 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87436">bug 87436</a>
              from <span class="vcard"><a class="email" href="mailto:rspliet&#64;eclipso.eu" title="Roy &lt;rspliet&#64;eclipso.eu&gt;"> <span class="fn">Roy</span></a>
</span></b>
        <pre>(In reply to Laurent Bigonville from <a href="show_bug.cgi?id=87436#c2">comment #2</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=110979" name="attach_110979" title="full dmesg">attachment 110979</a> <a href="attachment.cgi?id=110979&amp;action=edit" title="full dmesg">[details]</a></span>
&gt; full dmesg</span >

Unfortunately the start of the log (containing, amongst others, the full kernel
version and kernel parameters) have fallen off. Could you paste them as well
please?

One thing I did notice is that, other than for <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVC1] HDMI gives no more signal since 3.15 (optimus)"
   href="show_bug.cgi?id=84203">bug #84203</a>, you were not
attempting to resume from suspend when the error occured. What was the action
you performed about 45 minutes after boot? Did you plug in a monitor, or
disable one, or change your resolution?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1418902786.8aAC2.4708--

--===============0913860324==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0913860324==--
