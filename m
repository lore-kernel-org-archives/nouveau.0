From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87554] [NV1A] 3.19-rc1 NULL dereference on modprobe
 in pramin_fini
Date: Sun, 21 Dec 2014 15:59:13 +0000
Message-ID: <bug-87554-8800-ZjXg0R6TKS@http.bugs.freedesktop.org/>
References: <bug-87554-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0432505115=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87554-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0432505115==
Content-Type: multipart/alternative; boundary="1419177553.ae58dCd21.20999"; charset="UTF-8"


--1419177553.ae58dCd21.20999
Date: Sun, 21 Dec 2014 15:59:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87554

--- Comment #2 from Bruno <bonbons67-H4aWS73dXupiYsDpGMXq6A@public.gmane.org> ---
Created attachment 111111
  --> https://bugs.freedesktop.org/attachment.cgi?id=111111&action=edit
Consider ->init NULL return as a failure

Things are crashing because pramin_init returns NULL (and not a ERR_PTR).

Would the following change be a proper fix?:

 static int
 shadow_method(struct nouveau_bios *bios, struct shadow *mthd, const char
*name)
 {
         const struct nvbios_source *func = mthd->func;
         if (func->name) {
                 nv_debug(bios, "trying %s...\n", name ? name : func->name);
                 if (func->init) {
                         mthd->data = func->init(bios, name);
                         if (IS_ERR(mthd->data)) {
                                 mthd->data = NULL;
                                 return 0;
+                        } else if (!mthd->data) {
+                                return 0;
                         }
                 }
                 mthd->score = shadow_score(bios, mthd);
                 if (func->fini)
                         func->fini(mthd->data);
                 nv_debug(bios, "scored %d\n", mthd->score);
                 mthd->data = bios->data;
                 mthd->size = bios->size;
                 bios->data  = NULL;
                 bios->size  = 0;
         }
         return mthd->score;
 }

If so, please apply attached patch.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1419177553.ae58dCd21.20999
Date: Sun, 21 Dec 2014 15:59:13 +0000
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
   title="NEW - [NV1A] 3.19-rc1 NULL dereference on modprobe in pramin_fini"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87554#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV1A] 3.19-rc1 NULL dereference on modprobe in pramin_fini"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87554">bug 87554</a>
              from <span class="vcard"><a class="email" href="mailto:bonbons67&#64;internet.lu" title="Bruno &lt;bonbons67&#64;internet.lu&gt;"> <span class="fn">Bruno</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=111111" name="attach_111111" title="Consider -&gt;init NULL return as a failure">attachment 111111</a> <a href="attachment.cgi?id=111111&amp;action=edit" title="Consider -&gt;init NULL return as a failure">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=87554&amp;attachment=111111'>[review]</a>
Consider -&gt;init NULL return as a failure

Things are crashing because pramin_init returns NULL (and not a ERR_PTR).

Would the following change be a proper fix?:

 static int
 shadow_method(struct nouveau_bios *bios, struct shadow *mthd, const char
*name)
 {
         const struct nvbios_source *func = mthd-&gt;func;
         if (func-&gt;name) {
                 nv_debug(bios, &quot;trying %s...\n&quot;, name ? name : func-&gt;name);
                 if (func-&gt;init) {
                         mthd-&gt;data = func-&gt;init(bios, name);
                         if (IS_ERR(mthd-&gt;data)) {
                                 mthd-&gt;data = NULL;
                                 return 0;
+                        } else if (!mthd-&gt;data) {
+                                return 0;
                         }
                 }
                 mthd-&gt;score = shadow_score(bios, mthd);
                 if (func-&gt;fini)
                         func-&gt;fini(mthd-&gt;data);
                 nv_debug(bios, &quot;scored %d\n&quot;, mthd-&gt;score);
                 mthd-&gt;data = bios-&gt;data;
                 mthd-&gt;size = bios-&gt;size;
                 bios-&gt;data  = NULL;
                 bios-&gt;size  = 0;
         }
         return mthd-&gt;score;
 }

If so, please apply attached patch.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1419177553.ae58dCd21.20999--

--===============0432505115==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0432505115==--
