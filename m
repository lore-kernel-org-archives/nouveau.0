From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78441] [NV46] X does not start under kernel 3.13.x
Date: Fri, 23 May 2014 19:34:41 +0000
Message-ID: <bug-78441-8800-mYdy1I5OSE@http.bugs.freedesktop.org/>
References: <bug-78441-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1290562153=="
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


--===============1290562153==
Content-Type: multipart/alternative; boundary="1400873681.f5a6Ebc1.27535"; charset="us-ascii"


--1400873681.f5a6Ebc1.27535
Date: Fri, 23 May 2014 19:34:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78441

--- Comment #7 from aebenjam-gGaKbNYk6w1Wk0Htik3J/w@public.gmane.org ---
Not sure that it's helpful, but I tried with the latest kernel (provided by
Fedora 19 - 3.14.4-100.fc19.i686) and it still failed to start the X session. 
I noticed, on the console while shutting down, that I was seeing messages:

E[Xorg[609]] failed to idle channel 0xcccc0001 [Xorg[609]]
E[Xorg[609]] failed to idle channel 0xcccc0000 [Xorg[609]] 

Not sure if that's useful to indicate what's going on.  It also took awhile for
it to finally shut down.

But, flipped back to 3.12.11-201.fc19.i686 and I'm up and running fine.

Adam

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1400873681.f5a6Ebc1.27535
Date: Fri, 23 May 2014 19:34:41 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78441#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV46] X does not start under kernel 3.13.x"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78441">bug 78441</a>
              from <span class="vcard"><a class="email" href="mailto:aebenjam&#64;opentext.com" title="aebenjam&#64;opentext.com">aebenjam&#64;opentext.com</a>
</span></b>
        <pre>Not sure that it's helpful, but I tried with the latest kernel (provided by
Fedora 19 - 3.14.4-100.fc19.i686) and it still failed to start the X session. 
I noticed, on the console while shutting down, that I was seeing messages:

E[Xorg[609]] failed to idle channel 0xcccc0001 [Xorg[609]]
E[Xorg[609]] failed to idle channel 0xcccc0000 [Xorg[609]] 

Not sure if that's useful to indicate what's going on.  It also took awhile for
it to finally shut down.

But, flipped back to 3.12.11-201.fc19.i686 and I'm up and running fine.

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

--1400873681.f5a6Ebc1.27535--

--===============1290562153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1290562153==--
