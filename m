From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91551] DXTn compressed normal maps produce severe
 artifacts on all NV5x and NVDx chipsets
Date: Tue, 04 Aug 2015 13:56:58 +0000
Message-ID: <bug-91551-8800-EB11LKHFsr@http.bugs.freedesktop.org/>
References: <bug-91551-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0058817391=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91551-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0058817391==
Content-Type: multipart/alternative; boundary="1438696618.fdC87fab0.3515"; charset="UTF-8"


--1438696618.fdC87fab0.3515
Date: Tue, 4 Aug 2015 13:56:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91551

--- Comment #3 from Mauro Rossi <issor.oruam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 117511
  --> https://bugs.freedesktop.org/attachment.cgi?id=117511&action=edit
dmesg extract with 'nouveau E' entries

These are related to FS2open process,
but I'm not systematically seeing the 'nouveau E' errors when launching FS2open
with normal maps enabled.

It may help to see if it's related or a different problem requiring to fill in
a new bug.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1438696618.fdC87fab0.3515
Date: Tue, 4 Aug 2015 13:56:58 +0000
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
   title="NEW - DXTn compressed normal maps produce severe artifacts on all NV5x and NVDx chipsets"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91551#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - DXTn compressed normal maps produce severe artifacts on all NV5x and NVDx chipsets"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91551">bug 91551</a>
              from <span class="vcard"><a class="email" href="mailto:issor.oruam&#64;gmail.com" title="Mauro Rossi &lt;issor.oruam&#64;gmail.com&gt;"> <span class="fn">Mauro Rossi</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=117511" name="attach_117511" title="dmesg extract with 'nouveau E' entries">attachment 117511</a> <a href="attachment.cgi?id=117511&amp;action=edit" title="dmesg extract with 'nouveau E' entries">[details]</a></span>
dmesg extract with 'nouveau E' entries

These are related to FS2open process,
but I'm not systematically seeing the 'nouveau E' errors when launching FS2open
with normal maps enabled.

It may help to see if it's related or a different problem requiring to fill in
a new bug.</pre>
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

--1438696618.fdC87fab0.3515--

--===============0058817391==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0058817391==--
