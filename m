From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90887] PhiMovesPass in register allocator broken
Date: Sun, 12 Jul 2015 18:41:02 +0000
Message-ID: <bug-90887-8800-3yHdLWcpsv@http.bugs.freedesktop.org/>
References: <bug-90887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1154020107=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90887-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1154020107==
Content-Type: multipart/alternative; boundary="1436726462.3484e2.21253"; charset="UTF-8"


--1436726462.3484e2.21253
Date: Sun, 12 Jul 2015 18:41:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90887

--- Comment #21 from jr <j-r-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org> ---
Created attachment 117077
  --> https://bugs.freedesktop.org/attachment.cgi?id=117077&action=edit
Prototype of a more highlevel graph modification api

After I realized that the prev/next arrays actually represent *two* linked
lists (one for the source and one for the target side) and that these are
circular it became easier:-)

I have attached a prototype of what I was hinting at in my first post. This is
only lightly tested (but seems to work for Lifeless Planet at least) and I'm
not sure that Pass is the correct place for the new method to live. It would
probably also be nice if edge splitting kept both the outgoing and the incoming
list of source and target resp. intact.

One improvement of this patch above my original proposal is that it produces
the same edge types as the current code. My earlier patch would keep the edge
type instead of setting it to FORWARD. While fixing that I was wondering
whether TREE is always correct for the edge into the new BB.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1436726462.3484e2.21253
Date: Sun, 12 Jul 2015 18:41:02 +0000
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
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887">bug 90887</a>
              from <span class="vcard"><a class="email" href="mailto:j-r&#64;online.de" title="jr &lt;j-r&#64;online.de&gt;"> <span class="fn">jr</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=117077" name="attach_117077" title="Prototype of a more highlevel graph modification api">attachment 117077</a> <a href="attachment.cgi?id=117077&amp;action=edit" title="Prototype of a more highlevel graph modification api">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=90887&amp;attachment=117077'>[review]</a>
Prototype of a more highlevel graph modification api

After I realized that the prev/next arrays actually represent *two* linked
lists (one for the source and one for the target side) and that these are
circular it became easier:-)

I have attached a prototype of what I was hinting at in my first post. This is
only lightly tested (but seems to work for Lifeless Planet at least) and I'm
not sure that Pass is the correct place for the new method to live. It would
probably also be nice if edge splitting kept both the outgoing and the incoming
list of source and target resp. intact.

One improvement of this patch above my original proposal is that it produces
the same edge types as the current code. My earlier patch would keep the edge
type instead of setting it to FORWARD. While fixing that I was wondering
whether TREE is always correct for the edge into the new BB.</pre>
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

--1436726462.3484e2.21253--

--===============1154020107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1154020107==--
