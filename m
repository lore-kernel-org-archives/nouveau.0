From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71620] nouveau_fence_wait_uevent NULL pointer
	dereference
Date: Sun, 24 Nov 2013 21:01:00 +0000
Message-ID: <bug-71620-8800-hA1E28cf7m@http.bugs.freedesktop.org/>
References: <bug-71620-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0844341623=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71620-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0844341623==
Content-Type: multipart/alternative; boundary="1385326860.2fFbD0.8832"; charset="us-ascii"


--1385326860.2fFbD0.8832
Date: Sun, 24 Nov 2013 21:01:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71620

--- Comment #1 from Kostadin Atanasov <kdatanasov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 89720
  --> https://bugs.freedesktop.org/attachment.cgi?id=89720&action=edit
better-multithreaded-protection-for-cence-channel

After almost 2 weeks running with this patch - the same problem happen. Looking
bit more on nouveau_fence_wait function looks like I miss one place where
multithreaded problem could occur - hence second patch to for it.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385326860.2fFbD0.8832
Date: Sun, 24 Nov 2013 21:01:00 +0000
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
   title="NEW --- - nouveau_fence_wait_uevent NULL pointer dereference"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71620#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau_fence_wait_uevent NULL pointer dereference"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71620">bug 71620</a>
              from <span class="vcard"><a class="email" href="mailto:kdatanasov&#64;gmail.com" title="Kostadin Atanasov &lt;kdatanasov&#64;gmail.com&gt;"> <span class="fn">Kostadin Atanasov</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=89720" name="attach_89720" title="better-multithreaded-protection-for-cence-channel">attachment 89720</a> <a href="attachment.cgi?id=89720&amp;action=edit" title="better-multithreaded-protection-for-cence-channel">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=71620&amp;attachment=89720'>[review]</a>
better-multithreaded-protection-for-cence-channel

After almost 2 weeks running with this patch - the same problem happen. Looking
bit more on nouveau_fence_wait function looks like I miss one place where
multithreaded problem could occur - hence second patch to for it.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385326860.2fFbD0.8832--

--===============0844341623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0844341623==--
