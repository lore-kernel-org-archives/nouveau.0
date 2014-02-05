From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70972] [NV67] Modesetting failure at 1280x800
Date: Wed, 05 Feb 2014 21:16:39 +0000
Message-ID: <bug-70972-8800-G239snvkaU@http.bugs.freedesktop.org/>
References: <bug-70972-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2106212337=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70972-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2106212337==
Content-Type: multipart/alternative; boundary="1391634999.f41d471.17107"; charset="us-ascii"


--1391634999.f41d471.17107
Date: Wed, 5 Feb 2014 21:16:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70972

--- Comment #8 from Larry Finger <larry.finger-tQ5ms3gMjBLk1uMJSBkQmQ@public.gmane.org> ---
I am now running 3.14-rc1, and the MSI changes for 3.13 should be in my kernel.

I added the patch mentioned in comment #7. I did not alter my xorg.conf.d setup
and X did not start, but I still had the screen double-up/faulty wrap in the
text screen.

Thanks for notifying me. Perhaps there are other register location differences.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391634999.f41d471.17107
Date: Wed, 5 Feb 2014 21:16:39 +0000
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
   title="NEW --- - [NV67] Modesetting failure at 1280x800"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70972#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV67] Modesetting failure at 1280x800"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70972">bug 70972</a>
              from <span class="vcard"><a class="email" href="mailto:larry.finger&#64;lwfinger.net" title="Larry Finger &lt;larry.finger&#64;lwfinger.net&gt;"> <span class="fn">Larry Finger</span></a>
</span></b>
        <pre>I am now running 3.14-rc1, and the MSI changes for 3.13 should be in my kernel.

I added the patch mentioned in <a href="show_bug.cgi?id=70972#c7">comment #7</a>. I did not alter my xorg.conf.d setup
and X did not start, but I still had the screen double-up/faulty wrap in the
text screen.

Thanks for notifying me. Perhaps there are other register location differences.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391634999.f41d471.17107--

--===============2106212337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2106212337==--
