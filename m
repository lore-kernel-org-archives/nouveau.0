From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56461] NV11 black screen & kernel hang on loading
	nouveaufb
Date: Tue, 18 Dec 2012 21:52:57 +0000
Message-ID: <bug-56461-8800-eqewtGhUJl@http.bugs.freedesktop.org/>
References: <bug-56461-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0432876518=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56461-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0432876518==
Content-Type: multipart/alternative; boundary="1355867577.4bc7c5F81.11628"; charset="us-ascii"


--1355867577.4bc7c5F81.11628
Date: Tue, 18 Dec 2012 21:52:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56461

--- Comment #29 from Chris Paulson-Ellis <chris-Tc38MJj1weLQT0dZR+AlfA@public.gmane.org> ---
I didn't include 3bb076af during this bisect on the basis that it made no
difference when running nouveau HEAD. I have now retested the problem commit
cb75d97e and it's parent 70790f4f, both with 3bb076af cherry-picked.

Things just get more complicated... Although the fade-to-black problem hasn't
changed, including 3bb076af makes the previously working parent commit exhibit
the 'hsync' problem I described before!

All tests include the dpms-fix patch from comment 19 to prevent the original
hard-hang problem.

In summary:

1) 70790f4f + dpms-fix             -  works
2) 70790f4f + 3bb076af + dpms-fix  -  the 'hsync' problem reappears!
3) cb75d97e + dpms-fix             -  fades to black
4) cb75d97e + 3bb076af + dpms-fix  -  fades to black

There's quite a bit of difference in the console logs between 70790f4f &
cb75d97e, but nothing obvious (to me). I'm attaching console logs for cases 1,
2 & 4.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1355867577.4bc7c5F81.11628
Date: Tue, 18 Dec 2012 21:52:57 +0000
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
   title="NEW --- - NV11 black screen &amp; kernel hang on loading nouveaufb"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56461#c29">Comment # 29</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - NV11 black screen &amp; kernel hang on loading nouveaufb"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56461">bug 56461</a>
              from <span class="vcard"><a class="email" href="mailto:chris&#64;edesix.com" title="Chris Paulson-Ellis &lt;chris&#64;edesix.com&gt;"> <span class="fn">Chris Paulson-Ellis</span></a>
</span></b>
        <pre>I didn't include 3bb076af during this bisect on the basis that it made no
difference when running nouveau HEAD. I have now retested the problem commit
cb75d97e and it's parent 70790f4f, both with 3bb076af cherry-picked.

Things just get more complicated... Although the fade-to-black problem hasn't
changed, including 3bb076af makes the previously working parent commit exhibit
the 'hsync' problem I described before!

All tests include the dpms-fix patch from <a href="show_bug.cgi?id=56461#c19">comment 19</a> to prevent the original
hard-hang problem.

In summary:

1) 70790f4f + dpms-fix             -  works
2) 70790f4f + 3bb076af + dpms-fix  -  the 'hsync' problem reappears!
3) cb75d97e + dpms-fix             -  fades to black
4) cb75d97e + 3bb076af + dpms-fix  -  fades to black

There's quite a bit of difference in the console logs between 70790f4f &amp;
cb75d97e, but nothing obvious (to me). I'm attaching console logs for cases 1,
2 &amp; 4.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1355867577.4bc7c5F81.11628--

--===============0432876518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0432876518==--
