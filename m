From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59069] nouveau E[     DRM] fail ttm_validate
Date: Mon, 14 Jan 2013 16:27:13 +0000
Message-ID: <bug-59069-8800-3EQRIYmL8w@http.bugs.freedesktop.org/>
References: <bug-59069-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1470784054=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59069-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1470784054==
Content-Type: multipart/alternative; boundary="1358180833.46e561.1205"; charset="us-ascii"


--1358180833.46e561.1205
Date: Mon, 14 Jan 2013 16:27:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59069

--- Comment #15 from Jacopo <jmoronat-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #11)
> Created attachment 72932 [details] [review]
> better logging v2
> 
> please attach kernel log with this patch applied


Hi Marcin,
I'm on Raring (Ubuntu +1), which is now based on 3.8.0 kernel. The bug is the
same, and it's anyway reproducible.
My question is: does your patch apply to 3.8 ? Cause patch -p1 gives me some
"Hunk FAILED".

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1358180833.46e561.1205
Date: Mon, 14 Jan 2013 16:27:13 +0000
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
   title="NEW --- - nouveau E[ DRM] fail ttm_validate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59069#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau E[ DRM] fail ttm_validate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59069">bug 59069</a>
              from <span class="vcard"><a class="email" href="mailto:jmoronat&#64;gmail.com" title="Jacopo &lt;jmoronat&#64;gmail.com&gt;"> <span class="fn">Jacopo</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=59069#c11">comment #11</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=72932" name="attach_72932" title="better logging v2">attachment 72932</a> <a href="attachment.cgi?id=72932&amp;action=edit" title="better logging v2">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=59069&amp;attachment=72932'>[review]</a> [review]
&gt; better logging v2
&gt; 
&gt; please attach kernel log with this patch applied</span >


Hi Marcin,
I'm on Raring (Ubuntu +1), which is now based on 3.8.0 kernel. The bug is the
same, and it's anyway reproducible.
My question is: does your patch apply to 3.8 ? Cause patch -p1 gives me some
&quot;Hunk FAILED&quot;.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1358180833.46e561.1205--

--===============1470784054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1470784054==--
