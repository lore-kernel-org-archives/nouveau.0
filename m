From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91972] [NVE4] xorg/nouveau crashes when running
 wine's unit tests under valgrind: EXA: malloc failed for size -262140 bytes
Date: Mon, 14 Sep 2015 03:42:10 +0000
Message-ID: <bug-91972-8800-RkGpahP4rt@http.bugs.freedesktop.org/>
References: <bug-91972-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1876506235=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91972-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1876506235==
Content-Type: multipart/alternative; boundary="1442202130.46b51.28011"; charset="UTF-8"


--1442202130.46b51.28011
Date: Mon, 14 Sep 2015 03:42:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91972

--- Comment #4 from Austin English <austinenglish-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #3)
> Can you also include the output of 'xrandr -q'? That should give me an idea
> of where the various outputs are located. Not sure if it'll be important to
> the bug, but easy information to collect.

Screen 0: minimum 320 x 200, current 1920 x 1200, maximum 8192 x 8192
DVI-I-1 disconnected (normal left inverted right x axis y axis)
DVI-D-1 connected 1920x1200+0+0 (normal left inverted right x axis y axis)
518mm x 324mm
   1920x1200     59.95*+
   1600x1200     60.00  
   1280x1024     75.02    60.02  
   1152x864      75.00  
   1024x768      75.08    60.00  
   800x600       75.00    60.32  
   640x480       75.00    60.00  
   720x400       70.08  
HDMI-2 disconnected (normal left inverted right x axis y axis)
DP-1 disconnected (normal left inverted right x axis y axis)
HDMI1 disconnected (normal left inverted right x axis y axis)
VGA1 disconnected (normal left inverted right x axis y axis)
VIRTUAL1 disconnected (normal left inverted right x axis y axis)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1442202130.46b51.28011
Date: Mon, 14 Sep 2015 03:42:10 +0000
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
   title="NEW - [NVE4] xorg/nouveau crashes when running wine's unit tests under valgrind: EXA: malloc failed for size -262140 bytes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91972#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] xorg/nouveau crashes when running wine's unit tests under valgrind: EXA: malloc failed for size -262140 bytes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91972">bug 91972</a>
              from <span class="vcard"><a class="email" href="mailto:austinenglish&#64;gmail.com" title="Austin English &lt;austinenglish&#64;gmail.com&gt;"> <span class="fn">Austin English</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=91972#c3">comment #3</a>)
<span class="quote">&gt; Can you also include the output of 'xrandr -q'? That should give me an idea
&gt; of where the various outputs are located. Not sure if it'll be important to
&gt; the bug, but easy information to collect.</span >

Screen 0: minimum 320 x 200, current 1920 x 1200, maximum 8192 x 8192
DVI-I-1 disconnected (normal left inverted right x axis y axis)
DVI-D-1 connected 1920x1200+0+0 (normal left inverted right x axis y axis)
518mm x 324mm
   1920x1200     59.95*+
   1600x1200     60.00  
   1280x1024     75.02    60.02  
   1152x864      75.00  
   1024x768      75.08    60.00  
   800x600       75.00    60.32  
   640x480       75.00    60.00  
   720x400       70.08  
HDMI-2 disconnected (normal left inverted right x axis y axis)
DP-1 disconnected (normal left inverted right x axis y axis)
HDMI1 disconnected (normal left inverted right x axis y axis)
VGA1 disconnected (normal left inverted right x axis y axis)
VIRTUAL1 disconnected (normal left inverted right x axis y axis)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1442202130.46b51.28011--

--===============1876506235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1876506235==--
