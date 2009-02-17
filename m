From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: running x.org on powerpc64 with nvidia6200
Date: Tue, 17 Feb 2009 11:13:10 -0500
Message-ID: <586c2acd0902170813h126ebddfsdfbc472fb11873e1@mail.gmail.com>
References: <49959366.2000805@gmail.com> <49968B05.4090701@gmail.com>
	<6a89f9d50902140232h4b262deby85e7b437067fbc99@mail.gmail.com>
	<21d7e9970902142118u50a56366u2efa5fe0d8aadd72@mail.gmail.com>
	<49996AD8.2010602@gmail.com>
	<586c2acd0902160759u535b18dfsb5554f5a2d1a3d21@mail.gmail.com>
	<4999BC41.2060200@gmail.com> <4999CB0E.1090505@gmail.com>
	<586c2acd0902170527u509cc3c8r63ddd372aac1e545@mail.gmail.com>
	<499ACDF7.6050202@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <499ACDF7.6050202-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: aik <aik.rsdn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Feb 17, 2009 at 9:47 AM, aik <aik.rsdn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Younes Manton wrote:
>>
>> You need various X dev packages installed... you are missing something
>> related to randr. I install xserver-xorg-dev, x11proto-randr-dev, etc
>> for example on Ubuntu and that usually solves my problems. Try finding
>> randr related dev packages for Fedora.
>>
>>
>
> Found, installed. Fails different now. As I understand, it builds the
> "intel" lib only.

You need the --enable-nouveau-experimental-api flag when configuring, e.g.:

./configure --enable-nouveau-experimental-api
