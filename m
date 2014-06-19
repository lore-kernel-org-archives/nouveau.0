From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80244] build failure on Ubuntu 13.10 - OK on 14.04
Date: Thu, 19 Jun 2014 18:44:01 +0000
Message-ID: <bug-80244-8800-BqKRviEGxz@http.bugs.freedesktop.org/>
References: <bug-80244-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1638111750=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80244-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1638111750==
Content-Type: multipart/alternative; boundary="1403203441.EDC25BF2.18463"; charset="us-ascii"


--1403203441.EDC25BF2.18463
Date: Thu, 19 Jun 2014 18:44:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80244

--- Comment #1 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 101375
  --> https://bugs.freedesktop.org/attachment.cgi?id=101375&action=edit
nouveau: correcly build nouveau_sync on DRI3-less X

Give this patch a try. Seems to fix things in here.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403203441.EDC25BF2.18463
Date: Thu, 19 Jun 2014 18:44:01 +0000
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
   title="NEW --- - build failure on Ubuntu 13.10 - OK on 14.04"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80244#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - build failure on Ubuntu 13.10 - OK on 14.04"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80244">bug 80244</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=101375" name="attach_101375" title="nouveau: correcly build nouveau_sync on DRI3-less X">attachment 101375</a> <a href="attachment.cgi?id=101375&amp;action=edit" title="nouveau: correcly build nouveau_sync on DRI3-less X">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=80244&amp;attachment=101375'>[review]</a>
nouveau: correcly build nouveau_sync on DRI3-less X

Give this patch a try. Seems to fix things in here.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403203441.EDC25BF2.18463--

--===============1638111750==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1638111750==--
