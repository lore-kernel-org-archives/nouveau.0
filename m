From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90390] [NV98] Modesetting causes blank screen
 because of INVALID_STATE [UNK0B] chid 1 mthd 0x0080 data 0x00000000
Date: Sun, 10 May 2015 21:14:51 +0000
Message-ID: <bug-90390-8800-oiFPR1cA9X@http.bugs.freedesktop.org/>
References: <bug-90390-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1811301358=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90390-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1811301358==
Content-Type: multipart/alternative; boundary="1431292491.F2Aa1.17717"; charset="UTF-8"


--1431292491.F2Aa1.17717
Date: Sun, 10 May 2015 21:14:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90390

--- Comment #6 from Dmitry Potapov <analizer-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org> ---
Created attachment 115671
  --> https://bugs.freedesktop.org/attachment.cgi?id=115671&action=edit
kernel log for 3.14.41-gentoo

Checked against kernel 3.14.41
Symptoms are same, but the error message is a bit different although I used the
same drm.debug=15

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1431292491.F2Aa1.17717
Date: Sun, 10 May 2015 21:14:51 +0000
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
   title="NEW - [NV98] Modesetting causes blank screen because of INVALID_STATE [UNK0B] chid 1 mthd 0x0080 data 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90390#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV98] Modesetting causes blank screen because of INVALID_STATE [UNK0B] chid 1 mthd 0x0080 data 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90390">bug 90390</a>
              from <span class="vcard"><a class="email" href="mailto:analizer&#64;yandex.ru" title="Dmitry Potapov &lt;analizer&#64;yandex.ru&gt;"> <span class="fn">Dmitry Potapov</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=115671" name="attach_115671" title="kernel log for 3.14.41-gentoo">attachment 115671</a> <a href="attachment.cgi?id=115671&amp;action=edit" title="kernel log for 3.14.41-gentoo">[details]</a></span>
kernel log for 3.14.41-gentoo

Checked against kernel 3.14.41
Symptoms are same, but the error message is a bit different although I used the
same drm.debug=15</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431292491.F2Aa1.17717--

--===============1811301358==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1811301358==--
