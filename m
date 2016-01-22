From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93795] G98: GL(X) compositing - XRandR DPMS trouble
Date: Fri, 22 Jan 2016 16:36:17 +0000
Message-ID: <bug-93795-8800-BIjTpQWXPj@http.bugs.freedesktop.org/>
References: <bug-93795-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1144102432=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93795-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1144102432==
Content-Type: multipart/alternative; boundary="14534805780.8840ADE78.1513";
 charset="UTF-8"


--14534805780.8840ADE78.1513
Date: Fri, 22 Jan 2016 16:36:18 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93795

--- Comment #1 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 121209
  --> https://bugs.freedesktop.org/attachment.cgi?id=121209&action=edit
GLX: KF5 XRandR DPMS


Screenshot postquam output enablement
$ xrandr --output DVI-I-1 --off ; sleep 5 ; xrandr --auto ; sleep 5 ; import
-window root screenie.png

GLX: remaining "fragment" of the screen can be seen in the top left corner,
session screen is unusable

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14534805780.8840ADE78.1513
Date: Fri, 22 Jan 2016 16:36:18 +0000
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
   title="NEW - G98: GL(X) compositing - XRandR DPMS trouble"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93795#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - G98: GL(X) compositing - XRandR DPMS trouble"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93795">bug 93795</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=121209" name="attach_121209" title="GLX: KF5 XRandR DPMS">attachment 121209</a> <a href="attachment.cgi?id=121209&amp;action=edit" title="GLX: KF5 XRandR DPMS">[details]</a></span>
GLX: KF5 XRandR DPMS


Screenshot postquam output enablement
$ xrandr --output DVI-I-1 --off ; sleep 5 ; xrandr --auto ; sleep 5 ; import
-window root screenie.png

GLX: remaining &quot;fragment&quot; of the screen can be seen in the top left corner,
session screen is unusable</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14534805780.8840ADE78.1513--

--===============1144102432==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1144102432==--
