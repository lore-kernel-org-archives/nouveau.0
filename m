From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91598] Broken Rendering of Plasma 5 Desktop
Date: Tue, 18 Aug 2015 15:28:24 +0000
Message-ID: <bug-91598-8800-NLdQAElk0y@http.bugs.freedesktop.org/>
References: <bug-91598-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1353892688=="
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


--===============1353892688==
Content-Type: multipart/alternative; boundary="1439911703.e6C0Ef21.14529"; charset="UTF-8"


--1439911703.e6C0Ef21.14529
Date: Tue, 18 Aug 2015 15:28:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91598

--- Comment #11 from David March <davidmarch007-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I was able to initiate an apitrace when some textual corruptions (but not the
full menu corruptions which happen in the later stages) started appearing on
the plasmashell menus.  However upon playing back the trace it does not
recreate the issue so I doubt it will do much good?  If you still want it let
me know.  the trace is 4.3 GB and gzip is able to take it down to about 2.5 GB.

If you only need to see it to see what it looks like when the corruptions occur
then would some before and after screenshots perhaps work better?

Also I have found that after closing some applications and then doing 'echo 1 >
/proc/sys/vm/drop_caches' I can almost immediately restore proper rendering
again.  Next time I will test further to see if dropping caches always works
even without closing any applications.  If it does I would think that narrows
down what is going on with this bug and what is triggering it.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1439911703.e6C0Ef21.14529
Date: Tue, 18 Aug 2015 15:28:23 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91598#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Broken Rendering of Plasma 5 Desktop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91598">bug 91598</a>
              from <span class="vcard"><a class="email" href="mailto:davidmarch007&#64;gmail.com" title="David March &lt;davidmarch007&#64;gmail.com&gt;"> <span class="fn">David March</span></a>
</span></b>
        <pre>I was able to initiate an apitrace when some textual corruptions (but not the
full menu corruptions which happen in the later stages) started appearing on
the plasmashell menus.  However upon playing back the trace it does not
recreate the issue so I doubt it will do much good?  If you still want it let
me know.  the trace is 4.3 GB and gzip is able to take it down to about 2.5 GB.

If you only need to see it to see what it looks like when the corruptions occur
then would some before and after screenshots perhaps work better?

Also I have found that after closing some applications and then doing 'echo 1 &gt;
/proc/sys/vm/drop_caches' I can almost immediately restore proper rendering
again.  Next time I will test further to see if dropping caches always works
even without closing any applications.  If it does I would think that narrows
down what is going on with this bug and what is triggering it.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1439911703.e6C0Ef21.14529--

--===============1353892688==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1353892688==--
