From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91954] "link training failed": nouveau does not
 recover from monitor suspend
Date: Thu, 10 Sep 2015 03:10:33 +0000
Message-ID: <bug-91954-8800-03G6cSzk6e@http.bugs.freedesktop.org/>
References: <bug-91954-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1384825173=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91954-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1384825173==
Content-Type: multipart/alternative; boundary="1441854633.Da4dE01F1.31615"; charset="UTF-8"


--1441854633.Da4dE01F1.31615
Date: Thu, 10 Sep 2015 03:10:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91954

--- Comment #1 from Dan Callaghan <djc-vNUPr3c+39GHXe+LvDLADg@public.gmane.org> ---
Created attachment 118176
  --> https://bugs.freedesktop.org/attachment.cgi?id=118176&action=edit
kernel messages showing "link training failed"

Complete kernel messages showing "link training failed".

At 11:34 the console went blank and the monitor started to go into power save,
but I hit a key while it was still powered on showing a "Power save mode"
message, before it actually powered down. Nouveau said "training complete" and
I got the image back.

At 11:44 the monitor went into power save again and I let it power all the way
down. Nouveau says "link training failed" and then "training complete" but the
monitor just goes back to power save, there is no image.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1441854633.Da4dE01F1.31615
Date: Thu, 10 Sep 2015 03:10:33 +0000
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
   title="NEW - &quot;link training failed&quot;: nouveau does not recover from monitor suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91954#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - &quot;link training failed&quot;: nouveau does not recover from monitor suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91954">bug 91954</a>
              from <span class="vcard"><a class="email" href="mailto:djc&#64;djc.id.au" title="Dan Callaghan &lt;djc&#64;djc.id.au&gt;"> <span class="fn">Dan Callaghan</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=118176" name="attach_118176" title="kernel messages showing &quot;link training failed&quot;">attachment 118176</a> <a href="attachment.cgi?id=118176&amp;action=edit" title="kernel messages showing &quot;link training failed&quot;">[details]</a></span>
kernel messages showing &quot;link training failed&quot;

Complete kernel messages showing &quot;link training failed&quot;.

At 11:34 the console went blank and the monitor started to go into power save,
but I hit a key while it was still powered on showing a &quot;Power save mode&quot;
message, before it actually powered down. Nouveau said &quot;training complete&quot; and
I got the image back.

At 11:44 the monitor went into power save again and I let it power all the way
down. Nouveau says &quot;link training failed&quot; and then &quot;training complete&quot; but the
monitor just goes back to power save, there is no image.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1441854633.Da4dE01F1.31615--

--===============1384825173==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1384825173==--
