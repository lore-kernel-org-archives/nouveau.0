From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75569] [nv34] [v3.14-rc3] DMA_PUSHER get 0x00029044
 put 0x000184d0 state 0x80000040 (err: INVALID_CMD) push 0x00000000
Date: Sat, 01 Mar 2014 16:44:21 +0000
Message-ID: <bug-75569-8800-N7386OdPCl@http.bugs.freedesktop.org/>
References: <bug-75569-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1967806734=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75569-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1967806734==
Content-Type: multipart/alternative; boundary="1393692261.72Af1.652"; charset="us-ascii"


--1393692261.72Af1.652
Date: Sat, 1 Mar 2014 16:44:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75569

--- Comment #7 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
With nouveau.vram_pushbuf it seems to hang but also to recover. It did this
twice in a row:

[  989.334399] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 1 [X[730]] get
0x00519000 put 0x00519090 state 0x80000054 (err: INVALID_CMD) push 0x00000000
[ 1017.880696] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 1 [X[730]] get
0x00519000 put 0x00519088 state 0x80000000 (err: INVALID_CMD) push 0x00000000
[ 1080.599917] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 1 [X[730]] get
0x00519000 put 0x00519080 state 0x80000054 (err: INVALID_CMD) push 0x00000000
[ 1182.233193] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 1 [X[730]] get
0x00519000 put 0x00519088 state 0x80000000 (err: INVALID_CMD) push 0x00000000
[ 1210.013989] bpkt raw broadcast: IN=enp0s18 OUT=
MAC=ff:ff:ff:ff:ff:ff:b4:b6:76:5d:7c:b2:08:00 SRC=0.0.0.0 DST=255.255.255.255
LEN=328 TOS=0x00 PREC=0x00 TTL=128 ID=27791 PROTO=UDP SPT=68 DPT=67 LEN=308 
[ 1227.086996] BTRFS: device fsid 6cc7990a-8185-441a-b90d-c73a25f7d4cc devid 1
transid 271 /dev/mapper/main-boot
[ 1227.088925] BTRFS info (device dm-6): disk space caching is enabled
[ 1234.066610] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 1 [X[730]] get
0x00519000 put 0x00519090 state 0x80000054 (err: INVALID_CMD) push 0x00000000


... continues here

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393692261.72Af1.652
Date: Sat, 1 Mar 2014 16:44:21 +0000
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
   title="NEW --- - [nv34] [v3.14-rc3] DMA_PUSHER get 0x00029044 put 0x000184d0 state 0x80000040 (err: INVALID_CMD) push 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75569#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nv34] [v3.14-rc3] DMA_PUSHER get 0x00029044 put 0x000184d0 state 0x80000040 (err: INVALID_CMD) push 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75569">bug 75569</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>With nouveau.vram_pushbuf it seems to hang but also to recover. It did this
twice in a row:

[  989.334399] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 1 [X[730]] get
0x00519000 put 0x00519090 state 0x80000054 (err: INVALID_CMD) push 0x00000000
[ 1017.880696] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 1 [X[730]] get
0x00519000 put 0x00519088 state 0x80000000 (err: INVALID_CMD) push 0x00000000
[ 1080.599917] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 1 [X[730]] get
0x00519000 put 0x00519080 state 0x80000054 (err: INVALID_CMD) push 0x00000000
[ 1182.233193] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 1 [X[730]] get
0x00519000 put 0x00519088 state 0x80000000 (err: INVALID_CMD) push 0x00000000
[ 1210.013989] bpkt raw broadcast: IN=enp0s18 OUT=
MAC=ff:ff:ff:ff:ff:ff:b4:b6:76:5d:7c:b2:08:00 SRC=0.0.0.0 DST=255.255.255.255
LEN=328 TOS=0x00 PREC=0x00 TTL=128 ID=27791 PROTO=UDP SPT=68 DPT=67 LEN=308 
[ 1227.086996] BTRFS: device fsid 6cc7990a-8185-441a-b90d-c73a25f7d4cc devid 1
transid 271 /dev/mapper/main-boot
[ 1227.088925] BTRFS info (device dm-6): disk space caching is enabled
[ 1234.066610] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 1 [X[730]] get
0x00519000 put 0x00519090 state 0x80000054 (err: INVALID_CMD) push 0x00000000


... continues here</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393692261.72Af1.652--

--===============1967806734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1967806734==--
