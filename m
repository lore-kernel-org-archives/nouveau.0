From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 47846] Nouveau -> overscan using HDMI
Date: Thu, 07 Jan 2016 22:21:21 +0000
Message-ID: <bug-47846-8800-fEKXcF22kn@http.bugs.freedesktop.org/>
References: <bug-47846-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0078146980=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-47846-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0078146980==
Content-Type: multipart/alternative; boundary="1452205280.6dAD4Cb1.29210"; charset="UTF-8"


--1452205280.6dAD4Cb1.29210
Date: Thu, 7 Jan 2016 22:21:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=47846

--- Comment #21 from lameventanas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
(In reply to ITwrx from comment #20)
> @lameventanas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> 
> i ran "kodi -send --action='ActivateWindow(screencalibration)'"
> 
> but it just opened up kodi in default fashion and underscan was still not
> accounted for. was "screencalibration" above just an example?
> 
> thanks

You have to run this (don't insert a space):
"kodi-send --action='ActivateWindow(screencalibration)'"

once Kodi is already running, it will trigger the screen calibration dialog,
where you can compensate for overscan/underscan by yourself (in Kodi).  You can
also find it somewhere in the Settings window.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1452205280.6dAD4Cb1.29210
Date: Thu, 7 Jan 2016 22:21:20 +0000
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
          bz_status_REOPENED "
   title="REOPENED - Nouveau -&gt; overscan using HDMI"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=47846#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - Nouveau -&gt; overscan using HDMI"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=47846">bug 47846</a>
              from <span class="vcard"><a class="email" href="mailto:lameventanas&#64;gmail.com" title="lameventanas&#64;gmail.com">lameventanas&#64;gmail.com</a>
</span></b>
        <pre>(In reply to ITwrx from <a href="show_bug.cgi?id=47846#c20">comment #20</a>)
<span class="quote">&gt; &#64;<a href="mailto:lameventanas&#64;gmail.com">lameventanas&#64;gmail.com</a>
&gt; 
&gt; i ran &quot;kodi -send --action='ActivateWindow(screencalibration)'&quot;
&gt; 
&gt; but it just opened up kodi in default fashion and underscan was still not
&gt; accounted for. was &quot;screencalibration&quot; above just an example?
&gt; 
&gt; thanks</span >

You have to run this (don't insert a space):
&quot;kodi-send --action='ActivateWindow(screencalibration)'&quot;

once Kodi is already running, it will trigger the screen calibration dialog,
where you can compensate for overscan/underscan by yourself (in Kodi).  You can
also find it somewhere in the Settings window.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1452205280.6dAD4Cb1.29210--

--===============0078146980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0078146980==--
