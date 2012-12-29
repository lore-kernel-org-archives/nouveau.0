From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58735] GeForce 680, currently driver works on two,
 but not three monitors
Date: Sat, 29 Dec 2012 21:50:16 +0000
Message-ID: <bug-58735-8800-pVt7dH9pRN@http.bugs.freedesktop.org/>
References: <bug-58735-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0070262453=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58735-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0070262453==
Content-Type: multipart/alternative; boundary="1356817816.Df2dB00c2.4712"; charset="us-ascii"


--1356817816.Df2dB00c2.4712
Date: Sat, 29 Dec 2012 21:50:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58735

--- Comment #7 from Aleksi Torhamo <alexerion-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 72277
  --> https://bugs.freedesktop.org/attachment.cgi?id=72277&action=edit
patch to fix the regression

I bisected yesterday and found that the regression was introduced in commit
70790f4f. Patch attached.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1356817816.Df2dB00c2.4712
Date: Sat, 29 Dec 2012 21:50:16 +0000
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
   title="NEW --- - GeForce 680, currently driver works on two, but not three monitors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58735#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - GeForce 680, currently driver works on two, but not three monitors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58735">bug 58735</a>
              from <span class="vcard"><a class="email" href="mailto:alexerion&#64;gmail.com" title="Aleksi Torhamo &lt;alexerion&#64;gmail.com&gt;"> <span class="fn">Aleksi Torhamo</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=72277" name="attach_72277" title="patch to fix the regression">attachment 72277</a> <a href="attachment.cgi?id=72277&amp;action=edit" title="patch to fix the regression">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=58735&amp;attachment=72277'>[review]</a>
patch to fix the regression

I bisected yesterday and found that the regression was introduced in commit
70790f4f. Patch attached.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1356817816.Df2dB00c2.4712--

--===============0070262453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0070262453==--
