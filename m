From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91598] Broken Rendering of Plasma 5 Desktop
Date: Sat, 15 Aug 2015 00:23:42 +0000
Message-ID: <bug-91598-8800-Qx3TpG7TIR@http.bugs.freedesktop.org/>
References: <bug-91598-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1011717027=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91598-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1011717027==
Content-Type: multipart/alternative; boundary="1439598222.CCac1.28667"; charset="UTF-8"


--1439598222.CCac1.28667
Date: Sat, 15 Aug 2015 00:23:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91598

--- Comment #8 from David March <davidmarch007-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
@Ilia Mirkin, thanks  I will try to get an apitrace tonight or tomorrow.  Do
you need the whole session from start to finish or just from where it starts
messing up?  

Also it seems sometimes closing most applications (but not plasmashell) causes
the graphics to start rendering properly again for me.  I notice when it
happens it seems to occur when system memory is all filled up with
cache/buffers (but nowhere near filling up with application memory as I have
8GB and 16GB swap).  Closing applications frees up memory again.  I question
whether it could relate also to how the kernel is handling things when vRAM is
exhausted along with most memory used for cache?  I will also try to test some
earlier kernel versions to see if there is a difference in behavior.  I am
fairly sure once not too long I was not having graphics issues even with Plasma
5 (plasmashell) and compositing on.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1439598222.CCac1.28667
Date: Sat, 15 Aug 2015 00:23:42 +0000
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
   title="NEW - Broken Rendering of Plasma 5 Desktop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91598#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Broken Rendering of Plasma 5 Desktop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91598">bug 91598</a>
              from <span class="vcard"><a class="email" href="mailto:davidmarch007&#64;gmail.com" title="David March &lt;davidmarch007&#64;gmail.com&gt;"> <span class="fn">David March</span></a>
</span></b>
        <pre>&#64;Ilia Mirkin, thanks  I will try to get an apitrace tonight or tomorrow.  Do
you need the whole session from start to finish or just from where it starts
messing up?  

Also it seems sometimes closing most applications (but not plasmashell) causes
the graphics to start rendering properly again for me.  I notice when it
happens it seems to occur when system memory is all filled up with
cache/buffers (but nowhere near filling up with application memory as I have
8GB and 16GB swap).  Closing applications frees up memory again.  I question
whether it could relate also to how the kernel is handling things when vRAM is
exhausted along with most memory used for cache?  I will also try to test some
earlier kernel versions to see if there is a difference in behavior.  I am
fairly sure once not too long I was not having graphics issues even with Plasma
5 (plasmashell) and compositing on.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1439598222.CCac1.28667--

--===============1011717027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1011717027==--
