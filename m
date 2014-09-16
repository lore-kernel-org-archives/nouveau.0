From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31139] MBP5,x displays not turned on on resume
Date: Tue, 16 Sep 2014 07:30:10 +0000
Message-ID: <bug-31139-8800-2bXxlKcfqw@http.bugs.freedesktop.org/>
References: <bug-31139-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0857844245=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31139-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0857844245==
Content-Type: multipart/alternative; boundary="1410852610.aBeb1BF5.3858"; charset="us-ascii"


--1410852610.aBeb1BF5.3858
Date: Tue, 16 Sep 2014 07:30:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=31139

--- Comment #7 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
I've been playing a bit with the apple-gmux driver to check if it was the one
responsible but without success; the only difference between before suspending
and after resuming being GMUX_PORT_SWITCH_GET_DISPLAY which used to be 24
before suspending, and equals to 0 when resuming (and the discrete card coming
back online, but that was already dealt with). So, without Nouveau loaded, the
screen will stay black.

However, if using patches from
https://bugs.freedesktop.org/show_bug.cgi?id=27501#c29, the screen resumes
correctly.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1410852610.aBeb1BF5.3858
Date: Tue, 16 Sep 2014 07:30:10 +0000
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
   title="NEW --- - MBP5,x displays not turned on on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=31139#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - MBP5,x displays not turned on on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=31139">bug 31139</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>I've been playing a bit with the apple-gmux driver to check if it was the one
responsible but without success; the only difference between before suspending
and after resuming being GMUX_PORT_SWITCH_GET_DISPLAY which used to be 24
before suspending, and equals to 0 when resuming (and the discrete card coming
back online, but that was already dealt with). So, without Nouveau loaded, the
screen will stay black.

However, if using patches from
<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="show_bug.cgi?id=27501#c29">https://bugs.freedesktop.org/show_bug.cgi?id=27501#c29</a>, the screen resumes
correctly.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1410852610.aBeb1BF5.3858--

--===============0857844245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0857844245==--
