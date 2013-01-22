From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50121] [Regression] Since kernel v3.5 several cards
 fail to resume, introduced by: 'convert to exec engine,
 and improve channel sync'
Date: Tue, 22 Jan 2013 04:14:57 +0000
Message-ID: <bug-50121-8800-x1f2nQ95ah@http.bugs.freedesktop.org/>
References: <bug-50121-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0268921957=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-50121-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0268921957==
Content-Type: multipart/alternative; boundary="1358828098.bdcA5cCa5.24908"; charset="us-ascii"


--1358828098.bdcA5cCa5.24908
Date: Tue, 22 Jan 2013 04:14:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=50121

--- Comment #53 from Herton Krzesinski <herton-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> ---
Created attachment 73421
  --> https://bugs.freedesktop.org/attachment.cgi?id=73421&action=edit
Backport for 3.5 (and may be 3.6)

For who is still using or interested in kernel 3.5 or 3.6, can you try/verify
the attached patch? I checked and hope that it works, ended up being a simpler
diff.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1358828098.bdcA5cCa5.24908
Date: Tue, 22 Jan 2013 04:14:58 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121#c53">Comment # 53</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121">bug 50121</a>
              from <span class="vcard"><a class="email" href="mailto:herton&#64;canonical.com" title="Herton Krzesinski &lt;herton&#64;canonical.com&gt;"> <span class="fn">Herton Krzesinski</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=73421" name="attach_73421" title="Backport for 3.5 (and may be 3.6)">attachment 73421</a> <a href="attachment.cgi?id=73421&amp;action=edit" title="Backport for 3.5 (and may be 3.6)">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=50121&amp;attachment=73421'>[review]</a>
Backport for 3.5 (and may be 3.6)

For who is still using or interested in kernel 3.5 or 3.6, can you try/verify
the attached patch? I checked and hope that it works, ended up being a simpler
diff.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1358828098.bdcA5cCa5.24908--

--===============0268921957==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0268921957==--
