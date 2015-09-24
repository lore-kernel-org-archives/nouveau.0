From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91722] [NVE4] PGRAPH - grctx template channel unload
 timeout, failed to construct context, init failed, -16
Date: Thu, 24 Sep 2015 04:00:27 +0000
Message-ID: <bug-91722-8800-zrW6GGs4pU@http.bugs.freedesktop.org/>
References: <bug-91722-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0574660592=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91722-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0574660592==
Content-Type: multipart/alternative; boundary="1443067227.7C2CDEaF0.22302"; charset="UTF-8"


--1443067227.7C2CDEaF0.22302
Date: Thu, 24 Sep 2015 04:00:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91722

--- Comment #15 from kyle.devir-U10LOJoAJ6dBDgjK7y7TUQ@public.gmane.org ---
Created attachment 118419
  --> https://bugs.freedesktop.org/attachment.cgi?id=118419&action=edit
dmesg.log with 205877f9156daebb975fb46205488da6fdf5b3f5 patch

Here is my dmesg.log from use of the updated patch.

I used nouveau.config=War00C800_0=1 and nouveau.runpm=0 as my kernel options.
My software versions are still the same.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1443067227.7C2CDEaF0.22302
Date: Thu, 24 Sep 2015 04:00:27 +0000
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
   title="NEW - [NVE4] PGRAPH - grctx template channel unload timeout, failed to construct context, init failed, -16"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91722#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] PGRAPH - grctx template channel unload timeout, failed to construct context, init failed, -16"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91722">bug 91722</a>
              from <span class="vcard"><a class="email" href="mailto:kyle.devir&#64;mykolab.com" title="kyle.devir&#64;mykolab.com">kyle.devir&#64;mykolab.com</a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=118419" name="attach_118419" title="dmesg.log with 205877f9156daebb975fb46205488da6fdf5b3f5 patch">attachment 118419</a> <a href="attachment.cgi?id=118419&amp;action=edit" title="dmesg.log with 205877f9156daebb975fb46205488da6fdf5b3f5 patch">[details]</a></span>
dmesg.log with 205877f9156daebb975fb46205488da6fdf5b3f5 patch

Here is my dmesg.log from use of the updated patch.

I used nouveau.config=War00C800_0=1 and nouveau.runpm=0 as my kernel options.
My software versions are still the same.</pre>
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

--1443067227.7C2CDEaF0.22302--

--===============0574660592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0574660592==--
