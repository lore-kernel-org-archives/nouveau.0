From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70212] glxinfo triggers assert in cso_release_all
 after 3f0627c2ad6
Date: Wed, 23 Oct 2013 15:47:28 +0000
Message-ID: <bug-70212-8800-NB5WVV8MC1@http.bugs.freedesktop.org/>
References: <bug-70212-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0668826806=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70212-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0668826806==
Content-Type: multipart/alternative; boundary="1382543248.8ECE31b12.19624"; charset="us-ascii"


--1382543248.8ECE31b12.19624
Date: Wed, 23 Oct 2013 15:47:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70212

--- Comment #6 from Brian Paul <brianp-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org> ---
Created attachment 88040
  --> https://bugs.freedesktop.org/attachment.cgi?id=88040&action=edit
limit samplers returned to PIPE_MAX_SAMPLERS

Can someone verify this patch to nv50?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1382543248.8ECE31b12.19624
Date: Wed, 23 Oct 2013 15:47:28 +0000
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
          bz_status_ASSIGNED "
   title="ASSIGNED --- - glxinfo triggers assert in cso_release_all after 3f0627c2ad6"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70212#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED --- - glxinfo triggers assert in cso_release_all after 3f0627c2ad6"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70212">bug 70212</a>
              from <span class="vcard"><a class="email" href="mailto:brianp&#64;vmware.com" title="Brian Paul &lt;brianp&#64;vmware.com&gt;"> <span class="fn">Brian Paul</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=88040" name="attach_88040" title="limit samplers returned to PIPE_MAX_SAMPLERS">attachment 88040</a> <a href="attachment.cgi?id=88040&amp;action=edit" title="limit samplers returned to PIPE_MAX_SAMPLERS">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=70212&amp;attachment=88040'>[review]</a>
limit samplers returned to PIPE_MAX_SAMPLERS

Can someone verify this patch to nv50?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1382543248.8ECE31b12.19624--

--===============0668826806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0668826806==--
