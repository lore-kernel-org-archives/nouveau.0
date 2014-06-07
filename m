From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78441] [NV46] X does not start under kernel 3.13.x
Date: Sat, 07 Jun 2014 17:11:33 +0000
Message-ID: <bug-78441-8800-sr4SJrgnnu@http.bugs.freedesktop.org/>
References: <bug-78441-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0124258008=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78441-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0124258008==
Content-Type: multipart/alternative; boundary="1402161092.86701.1218"; charset="us-ascii"


--1402161092.86701.1218
Date: Sat, 7 Jun 2014 17:11:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78441

--- Comment #13 from aebenjam-gGaKbNYk6w1Wk0Htik3J/w@public.gmane.org ---
It's like the kernel hates me and is trying to make a liar of me.  I *know* I
tried it before and it didn't work - but it's totally doing the job now. 
Booted up just fine.  Only thing I can think of is that it's a slightly newer
kernel since my previous test... although I'm guessing you're going to tell me
nothing changed.  Anyway, confirmed as working properly under
3.14.4-100.fc19.i686 with nouveau.config=NvMSI=0

Thank you very much for your help.  What is it I've just disabled?

Adam

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1402161092.86701.1218
Date: Sat, 7 Jun 2014 17:11:32 +0000
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
   title="NEW --- - [NV46] X does not start under kernel 3.13.x"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78441#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV46] X does not start under kernel 3.13.x"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78441">bug 78441</a>
              from <span class="vcard"><a class="email" href="mailto:aebenjam&#64;opentext.com" title="aebenjam&#64;opentext.com">aebenjam&#64;opentext.com</a>
</span></b>
        <pre>It's like the kernel hates me and is trying to make a liar of me.  I *know* I
tried it before and it didn't work - but it's totally doing the job now. 
Booted up just fine.  Only thing I can think of is that it's a slightly newer
kernel since my previous test... although I'm guessing you're going to tell me
nothing changed.  Anyway, confirmed as working properly under
3.14.4-100.fc19.i686 with nouveau.config=NvMSI=0

Thank you very much for your help.  What is it I've just disabled?

Adam</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1402161092.86701.1218--

--===============0124258008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0124258008==--
