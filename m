From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67382] [nouveau,
 nv50] linux 3.9.7-3.10.3: Xorg won't be available
Date: Fri, 02 Aug 2013 17:50:01 +0000
Message-ID: <bug-67382-8800-DgSQMzKt8Q@http.bugs.freedesktop.org/>
References: <bug-67382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0150318550=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67382-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0150318550==
Content-Type: multipart/alternative; boundary="1375465801.d1EbDf5D2.27278"; charset="us-ascii"


--1375465801.d1EbDf5D2.27278
Date: Fri, 2 Aug 2013 17:50:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67382

--- Comment #25 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 83549
  --> https://bugs.freedesktop.org/attachment.cgi?id=83549&action=edit
possible fix

Still not too sure how come your system senses a monitor connected to your
second dvi port.

This patch reverts some of the new stuff introduced during the transition to
core. Please apply this patch on top of 3.9 branch (i.e. after the offending
commit)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375465801.d1EbDf5D2.27278
Date: Fri, 2 Aug 2013 17:50:01 +0000
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
   title="NEW --- - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be available"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67382#c25">Comment # 25</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be available"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67382">bug 67382</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=83549" name="attach_83549" title="possible fix">attachment 83549</a> <a href="attachment.cgi?id=83549&amp;action=edit" title="possible fix">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=67382&amp;attachment=83549'>[review]</a>
possible fix

Still not too sure how come your system senses a monitor connected to your
second dvi port.

This patch reverts some of the new stuff introduced during the transition to
core. Please apply this patch on top of 3.9 branch (i.e. after the offending
commit)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375465801.d1EbDf5D2.27278--

--===============0150318550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0150318550==--
