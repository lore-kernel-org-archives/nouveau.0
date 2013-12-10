From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE7] Failed to initialise context object:
 2D_NVC0 (0) (for my GeForce GT 750M)
Date: Tue, 10 Dec 2013 13:12:05 +0000
Message-ID: <bug-70354-8800-LZPMvyY6p3@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0474673605=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70354-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0474673605==
Content-Type: multipart/alternative; boundary="1386681125.54E02.31757"; charset="us-ascii"


--1386681125.54E02.31757
Date: Tue, 10 Dec 2013 13:12:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

--- Comment #17 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
If any of you are up for it, there's a HUB_INIT timeout fix in Ben's
repository. It's set up as an out-of-tree module:

git clone git://people.freedesktop.org/~darktama/nouveau
cd nouveau/drm; make

That should create a nouveau.ko that you can use. The tree it will compile
against probably has to be 3.13-rc1+. (You can also port the patches over to
the linux tree with a bunch of sed work.)

P.S. The patch in question is:
http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=0c463bb767a0af0781256ec118c5890077c2f46c

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1386681125.54E02.31757
Date: Tue, 10 Dec 2013 13:12:05 +0000
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
   title="NEW --- - [NVE7] Failed to initialise context object: 2D_NVC0 (0) (for my GeForce GT 750M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] Failed to initialise context object: 2D_NVC0 (0) (for my GeForce GT 750M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>If any of you are up for it, there's a HUB_INIT timeout fix in Ben's
repository. It's set up as an out-of-tree module:

git clone git://people.freedesktop.org/~darktama/nouveau
cd nouveau/drm; make

That should create a nouveau.ko that you can use. The tree it will compile
against probably has to be 3.13-rc1+. (You can also port the patches over to
the linux tree with a bunch of sed work.)

P.S. The patch in question is:
<a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=0c463bb767a0af0781256ec118c5890077c2f46c">http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=0c463bb767a0af0781256ec118c5890077c2f46c</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1386681125.54E02.31757--

--===============0474673605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0474673605==--
