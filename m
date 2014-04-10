From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75761] weston-launch no output - black screen
Date: Thu, 10 Apr 2014 22:04:39 +0000
Message-ID: <bug-75761-8800-lFRF5g9XL1@http.bugs.freedesktop.org/>
References: <bug-75761-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1857650128=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75761-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1857650128==
Content-Type: multipart/alternative; boundary="1397167479.fc2d834.8642"; charset="us-ascii"


--1397167479.fc2d834.8642
Date: Thu, 10 Apr 2014 22:04:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75761

--- Comment #13 from Lubosz Sarnecki <lubosz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
My bisection process so far is pretty frustrating, 
since the majority of the commits between 3.12 and 3.13 do not boot. 
I get corrupted output before being able to login. 

The screen looks like so:

http://i.imgur.com/C517qpP.jpg

My current progress:

# v3.12 good
# 0fef9d8a59abcd699761cb054b6c37a2bea9e31a  skip / won't boot
# 48ae0b355f21533145133002854de89a0537408d  skip / won't boot
# c17f5bb529221c7f4c0736e69ceb614da0df2838  bad
# 8df1d0c07f18bd84ea7d8c7bc2cff45ba2b09680  skip / won't boot
# 16c4f227ffc556a4851518092e2b5979da1280c1  skip / won't boot
# 5fa7543041cbc2d3139e8d2178df61a33ac3f9ac  skip / won't boot
# 6d8d163132d7df6ca701efcde7832046ecb2f040  skip / won't boot
# 98706ea99f2da8afdac69686de4ff982aca6a5c7  skip / won't boot
# v3.13 bad
# v3.14 bad

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397167479.fc2d834.8642
Date: Thu, 10 Apr 2014 22:04:39 +0000
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
   title="NEW --- - weston-launch no output - black screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75761#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - weston-launch no output - black screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75761">bug 75761</a>
              from <span class="vcard"><a class="email" href="mailto:lubosz&#64;gmail.com" title="Lubosz Sarnecki &lt;lubosz&#64;gmail.com&gt;"> <span class="fn">Lubosz Sarnecki</span></a>
</span></b>
        <pre>My bisection process so far is pretty frustrating, 
since the majority of the commits between 3.12 and 3.13 do not boot. 
I get corrupted output before being able to login. 

The screen looks like so:

<a href="http://i.imgur.com/C517qpP.jpg">http://i.imgur.com/C517qpP.jpg</a>

My current progress:

# v3.12 good
# 0fef9d8a59abcd699761cb054b6c37a2bea9e31a  skip / won't boot
# 48ae0b355f21533145133002854de89a0537408d  skip / won't boot
# c17f5bb529221c7f4c0736e69ceb614da0df2838  bad
# 8df1d0c07f18bd84ea7d8c7bc2cff45ba2b09680  skip / won't boot
# 16c4f227ffc556a4851518092e2b5979da1280c1  skip / won't boot
# 5fa7543041cbc2d3139e8d2178df61a33ac3f9ac  skip / won't boot
# 6d8d163132d7df6ca701efcde7832046ecb2f040  skip / won't boot
# 98706ea99f2da8afdac69686de4ff982aca6a5c7  skip / won't boot
# v3.13 bad
# v3.14 bad</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397167479.fc2d834.8642--

--===============1857650128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1857650128==--
