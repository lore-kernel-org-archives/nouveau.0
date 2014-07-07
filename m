From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80865] [NVE7] Hard hang (GPC0/TPC0/MP trap:
 MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS)
Date: Mon, 07 Jul 2014 12:05:34 +0000
Message-ID: <bug-80865-8800-Rt8RxSJhxc@http.bugs.freedesktop.org/>
References: <bug-80865-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1919095799=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80865-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1919095799==
Content-Type: multipart/alternative; boundary="1404734734.2D64D1.9485"; charset="us-ascii"


--1404734734.2D64D1.9485
Date: Mon, 7 Jul 2014 12:05:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80865

--- Comment #6 from tethys-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
localhost:~# rpm -qa | fgrep mesa
mesa-libGL-10.1.5-1.20140607.fc20.i686
mesa-libglapi-10.1.5-1.20140607.fc20.x86_64
mesa-filesystem-10.1.5-1.20140607.fc20.x86_64
mesa-libglapi-10.1.5-1.20140607.fc20.i686
mesa-libGLU-9.0.0-5.fc20.x86_64
mesa-libgbm-10.1.5-1.20140607.fc20.x86_64
mesa-libwayland-egl-10.1.5-1.20140607.fc20.x86_64
mesa-dri-drivers-10.1.5-1.20140607.fc20.x86_64
mesa-libEGL-10.1.5-1.20140607.fc20.x86_64
mesa-libxatracker-10.1.5-1.20140607.fc20.x86_64
mesa-libGL-10.1.5-1.20140607.fc20.x86_64

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1404734734.2D64D1.9485
Date: Mon, 7 Jul 2014 12:05:34 +0000
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
   title="NEW --- - [NVE7] Hard hang (GPC0/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80865#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] Hard hang (GPC0/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80865">bug 80865</a>
              from <span class="vcard"><a class="email" href="mailto:tethys&#64;gmail.com" title="tethys&#64;gmail.com">tethys&#64;gmail.com</a>
</span></b>
        <pre>localhost:~# rpm -qa | fgrep mesa
mesa-libGL-10.1.5-1.20140607.fc20.i686
mesa-libglapi-10.1.5-1.20140607.fc20.x86_64
mesa-filesystem-10.1.5-1.20140607.fc20.x86_64
mesa-libglapi-10.1.5-1.20140607.fc20.i686
mesa-libGLU-9.0.0-5.fc20.x86_64
mesa-libgbm-10.1.5-1.20140607.fc20.x86_64
mesa-libwayland-egl-10.1.5-1.20140607.fc20.x86_64
mesa-dri-drivers-10.1.5-1.20140607.fc20.x86_64
mesa-libEGL-10.1.5-1.20140607.fc20.x86_64
mesa-libxatracker-10.1.5-1.20140607.fc20.x86_64
mesa-libGL-10.1.5-1.20140607.fc20.x86_64</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1404734734.2D64D1.9485--

--===============1919095799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1919095799==--
