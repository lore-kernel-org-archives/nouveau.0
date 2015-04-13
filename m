From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 47846] Nouveau -> overscan using HDMI
Date: Mon, 13 Apr 2015 13:06:05 +0000
Message-ID: <bug-47846-8800-lxTd6XxkeK@http.bugs.freedesktop.org/>
References: <bug-47846-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1064318096=="
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


--===============1064318096==
Content-Type: multipart/alternative; boundary="1428930365.5AeCE1.16011"; charset="UTF-8"


--1428930365.5AeCE1.16011
Date: Mon, 13 Apr 2015 13:06:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=47846

Soren Harward <stharward-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|WONTFIX                     |---

--- Comment #17 from Soren Harward <stharward-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I hate to revive a closed bug, but I'm having this problem too.  My nVidia card
is connected to though HDMI to a TV that doesn't permit overscanning to be
disabled.  I can compensate for it in X by setting hborder and vborder with
xrandr, like in comment #1.  But there's no equivalent options for the
framebuffer console, so I lose the top and bottom lines of the console, and
about six characters on either side.

I guess this is a feature request rather than a bug: add some kind of setting
to nouveaufb that allows underscan to be controlled.  The ideal would be
hborder and vborder settings same as xrandr uses.  This would be far easier to
deal with than trying to mess around with EDIDs, or expecting all TV
manufacturers to add a "disable overscan" feature to their displays.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1428930365.5AeCE1.16011
Date: Mon, 13 Apr 2015 13:06:05 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:stharward&#64;gmail.com" title="Soren Harward &lt;stharward&#64;gmail.com&gt;"> <span class="fn">Soren Harward</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - Nouveau -&gt; overscan using HDMI"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=47846">bug 47846</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>REOPENED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>WONTFIX
           </td>
           <td>---
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - Nouveau -&gt; overscan using HDMI"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=47846#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - Nouveau -&gt; overscan using HDMI"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=47846">bug 47846</a>
              from <span class="vcard"><a class="email" href="mailto:stharward&#64;gmail.com" title="Soren Harward &lt;stharward&#64;gmail.com&gt;"> <span class="fn">Soren Harward</span></a>
</span></b>
        <pre>I hate to revive a closed bug, but I'm having this problem too.  My nVidia card
is connected to though HDMI to a TV that doesn't permit overscanning to be
disabled.  I can compensate for it in X by setting hborder and vborder with
xrandr, like in <a href="show_bug.cgi?id=47846#c1">comment #1</a>.  But there's no equivalent options for the
framebuffer console, so I lose the top and bottom lines of the console, and
about six characters on either side.

I guess this is a feature request rather than a bug: add some kind of setting
to nouveaufb that allows underscan to be controlled.  The ideal would be
hborder and vborder settings same as xrandr uses.  This would be far easier to
deal with than trying to mess around with EDIDs, or expecting all TV
manufacturers to add a &quot;disable overscan&quot; feature to their displays.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1428930365.5AeCE1.16011--

--===============1064318096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1064318096==--
