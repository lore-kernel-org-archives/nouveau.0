From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87552] [NV1A] 3.18.1 BUG on modprobe nouveau in
 drivers/gpu/drm/nouveau/core/core/event.c:42
Date: Sun, 21 Dec 2014 16:36:27 +0000
Message-ID: <bug-87552-8800-FftCAYRyhf@http.bugs.freedesktop.org/>
References: <bug-87552-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1754773599=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87552-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1754773599==
Content-Type: multipart/alternative; boundary="1419179787.cdedAe81.4811"; charset="UTF-8"


--1419179787.cdedAe81.4811
Date: Sun, 21 Dec 2014 16:36:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87552

--- Comment #2 from Bruno <bonbons67-H4aWS73dXupiYsDpGMXq6A@public.gmane.org> ---
Created attachment 111115
  --> https://bugs.freedesktop.org/attachment.cgi?id=111115&action=edit
BUG_ON(!spin_is_locked(lock)) is taboo on UP

void
nvkm_event_get(struct nvkm_event *event, u32 types, int index)
{
        BUG_ON(!spin_is_locked(&event->refs_lock));
        while (types) {
                int type = __ffs(types); types &= ~(1 << type);
                if (++event->refs[index * event->types_nr + type] == 1) {
                        if (event->func->init)
                                event->func->init(event, 1 << type, index);
                }
        }
}

Is it ever valid to do these spin_is_locked() checks on !SMP system?

!SMP system do not have spinlocks at all!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1419179787.cdedAe81.4811
Date: Sun, 21 Dec 2014 16:36:27 +0000
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
   title="NEW - [NV1A] 3.18.1 BUG on modprobe nouveau in drivers/gpu/drm/nouveau/core/core/event.c:42"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87552#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV1A] 3.18.1 BUG on modprobe nouveau in drivers/gpu/drm/nouveau/core/core/event.c:42"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87552">bug 87552</a>
              from <span class="vcard"><a class="email" href="mailto:bonbons67&#64;internet.lu" title="Bruno &lt;bonbons67&#64;internet.lu&gt;"> <span class="fn">Bruno</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=111115" name="attach_111115" title="BUG_ON(!spin_is_locked(lock)) is taboo on UP">attachment 111115</a> <a href="attachment.cgi?id=111115&amp;action=edit" title="BUG_ON(!spin_is_locked(lock)) is taboo on UP">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=87552&amp;attachment=111115'>[review]</a>
BUG_ON(!spin_is_locked(lock)) is taboo on UP

void
nvkm_event_get(struct nvkm_event *event, u32 types, int index)
{
        BUG_ON(!spin_is_locked(&amp;event-&gt;refs_lock));
        while (types) {
                int type = __ffs(types); types &amp;= ~(1 &lt;&lt; type);
                if (++event-&gt;refs[index * event-&gt;types_nr + type] == 1) {
                        if (event-&gt;func-&gt;init)
                                event-&gt;func-&gt;init(event, 1 &lt;&lt; type, index);
                }
        }
}

Is it ever valid to do these spin_is_locked() checks on !SMP system?

!SMP system do not have spinlocks at all!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1419179787.cdedAe81.4811--

--===============1754773599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1754773599==--
