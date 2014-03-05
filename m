From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75279] XCloseDisplay() takes one minute around
 nouveau_dri.so, freezing Firefox startup
Date: Wed, 05 Mar 2014 20:57:36 +0000
Message-ID: <bug-75279-8800-tQGzjquQpw@http.bugs.freedesktop.org/>
References: <bug-75279-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0322137802=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75279-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0322137802==
Content-Type: multipart/alternative; boundary="1394053056.2d25d12.30644"; charset="us-ascii"


--1394053056.2d25d12.30644
Date: Wed, 5 Mar 2014 20:57:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75279

--- Comment #38 from Benoit Jacob <bjacob-4eJtQOnFJqFBDgjK7y7TUQ@public.gmane.org> ---
I wasn't clear enough in comment 34, let me explain better :-)

The Mozilla change that exposed this,
https://bugzilla.mozilla.org/show_bug.cgi?id=860254, is exactly about having
memory overwritten immediately on free(). So this is _exactly_ what is
happening here :-)

The reason why the stand-alone glxtest program doesn't hang is that it doesn't
use Mozilla's modified memory allocator that overwrites memory on free(). If
you ran it with this memory allocator, no doubt that it would hang there, as
this loop would keep reading a wrong fence->status.

So what you can hope to reproduce yourself with this glxtest program is not the
hang, it's the valgrind-detected use-after-free, and I really believe that that
is the root cause for the hang when running with Mozilla's memory allocator.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1394053056.2d25d12.30644
Date: Wed, 5 Mar 2014 20:57:36 +0000
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
   title="NEW --- - XCloseDisplay() takes one minute around nouveau_dri.so, freezing Firefox startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279#c38">Comment # 38</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - XCloseDisplay() takes one minute around nouveau_dri.so, freezing Firefox startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279">bug 75279</a>
              from <span class="vcard"><a class="email" href="mailto:bjacob&#64;mozilla.com" title="Benoit Jacob &lt;bjacob&#64;mozilla.com&gt;"> <span class="fn">Benoit Jacob</span></a>
</span></b>
        <pre>I wasn't clear enough in <a href="show_bug.cgi?id=75279#c34">comment 34</a>, let me explain better :-)

The Mozilla change that exposed this,
<a href="https://bugzilla.mozilla.org/show_bug.cgi?id=860254">https://bugzilla.mozilla.org/show_bug.cgi?id=860254</a>, is exactly about having
memory overwritten immediately on free(). So this is _exactly_ what is
happening here :-)

The reason why the stand-alone glxtest program doesn't hang is that it doesn't
use Mozilla's modified memory allocator that overwrites memory on free(). If
you ran it with this memory allocator, no doubt that it would hang there, as
this loop would keep reading a wrong fence-&gt;status.

So what you can hope to reproduce yourself with this glxtest program is not the
hang, it's the valgrind-detected use-after-free, and I really believe that that
is the root cause for the hang when running with Mozilla's memory allocator.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1394053056.2d25d12.30644--

--===============0322137802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0322137802==--
