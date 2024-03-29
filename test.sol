// SPDX-License-Identifier: MIT

pragma solidity 0.8.6;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

// CAUTION
// This version of SafeMath should only be used with Solidity 0.8 or later,
// because it relies on the compiler's built in overflow checks.

/**
 * @dev Wrappers over Solidity's arithmetic operations.
 *
 * NOTE: `SafeMath` is no longer needed starting with Solidity 0.8. The compiler
 * now has built in overflow checking.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            uint256 c = a + b;
            if (c < a) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the substraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b > a) return (false, 0);
            return (true, a - b);
        }
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
            // benefit is lost if 'b' is also tested.
            // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
            if (a == 0) return (true, 0);
            uint256 c = a * b;
            if (c / a != b) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a / b);
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a % b);
        }
    }

    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator.
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b <= a, errorMessage);
            return a - b;
        }
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a / b;
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryMod}.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a % b;
        }
    }
}

library Math {
    /**
     * @dev Returns the largest of two numbers.
     */
    function max(uint256 a, uint256 b) internal pure returns (uint256) {
        return a >= b ? a : b;
    }

    /**
     * @dev Returns the smallest of two numbers.
     */
    function min(uint256 a, uint256 b) internal pure returns (uint256) {
        return a < b ? a : b;
    }

    /**
     * @dev Returns the average of two numbers. The result is rounded towards
     * zero.
     */
    function average(uint256 a, uint256 b) internal pure returns (uint256) {
        // (a + b) / 2 can overflow, so we distribute.
        return (a / 2) + (b / 2) + (((a % 2) + (b % 2)) / 2);
    }

    /**
     * @dev Returns the ceiling of the division of two numbers.
     *
     * This differs from standard division with `/` in that it rounds up instead
     * of rounding down.
     */
    function ceilDiv(uint256 a, uint256 b) internal pure returns (uint256) {
        // (a + b - 1) / b can overflow on addition, so we distribute.
        return a / b + (a % b == 0 ? 0 : 1);
    }
}

interface IERC20Metadata is IERC20 {
    /**
     * @dev Returns the name of the token.
     */
    function name() external view returns (string memory);

    /**
     * @dev Returns the symbol of the token.
     */
    function symbol() external view returns (string memory);

    /**
     * @dev Returns the decimals places of the token.
     */
    function decimals() external view returns (uint8);
}

/*
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}

contract ERC20 is Context, IERC20, IERC20Metadata {
    mapping(address => uint256) private _balances;

    mapping(address => mapping(address => uint256)) private _allowances;

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;

    /**
     * @dev Sets the values for {name} and {symbol}.
     *
     * The default value of {decimals} is 18. To select a different value for
     * {decimals} you should overload it.
     *
     * All two of these values are immutable: they can only be set once during
     * construction.
     */
    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    /**
     * @dev Returns the name of the token.
     */
    function name() public view virtual override returns (string memory) {
        return _name;
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }

    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
     * be displayed to a user as `5,05` (`505 / 10 ** 2`).
     *
     * Tokens usually opt for a value of 18, imitating the relationship between
     * Ether and Wei. This is the value {ERC20} uses, unless this function is
     * overridden;
     *
     * NOTE: This information is only used for _display_ purposes: it in
     * no way affects any of the arithmetic of the contract, including
     * {IERC20-balanceOf} and {IERC20-transfer}.
     */
    function decimals() public view virtual override returns (uint8) {
        return 18;
    }

    /**
     * @dev See {IERC20-totalSupply}.
     */
    function totalSupply() public view virtual override returns (uint256) {
        return _totalSupply;
    }

    /**
     * @dev See {IERC20-balanceOf}.
     */
    function balanceOf(address account) public view virtual override returns (uint256) {
        return _balances[account];
    }

    /**
     * @dev See {IERC20-transfer}.
     *
     * Requirements:
     *
     * - `recipient` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
     */
    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    /**
     * @dev See {IERC20-allowance}.
     */
    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }

    /**
     * @dev See {IERC20-approve}.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    /**
     * @dev See {IERC20-transferFrom}.
     *
     * Emits an {Approval} event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of {ERC20}.
     *
     * Requirements:
     *
     * - `sender` and `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     * - the caller must have allowance for ``sender``'s tokens of at least
     * `amount`.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public virtual override returns (bool) {
        _transfer(sender, recipient, amount);

        uint256 currentAllowance = _allowances[sender][_msgSender()];
        require(currentAllowance >= amount, "ERC20: transfer amount exceeds allowance");
        unchecked {
            _approve(sender, _msgSender(), currentAllowance - amount);
        }

        return true;
    }

    /**
     * @dev Atomically increases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender] + addedValue);
        return true;
    }

    /**
     * @dev Atomically decreases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `spender` must have allowance for the caller of at least
     * `subtractedValue`.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        uint256 currentAllowance = _allowances[_msgSender()][spender];
        require(currentAllowance >= subtractedValue, "ERC20: decreased allowance below zero");
        unchecked {
            _approve(_msgSender(), spender, currentAllowance - subtractedValue);
        }

        return true;
    }

    /**
     * @dev Moves `amount` of tokens from `sender` to `recipient`.
     *
     * This internal function is equivalent to {transfer}, and can be used to
     * e.g. implement automatic token fees, slashing mechanisms, etc.
     *
     * Emits a {Transfer} event.
     *
     * Requirements:
     *
     * - `sender` cannot be the zero address.
     * - `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     */
    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal virtual {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _beforeTokenTransfer(sender, recipient, amount);

        uint256 senderBalance = _balances[sender];
        require(senderBalance >= amount, "ERC20: transfer amount exceeds balance");
        unchecked {
            _balances[sender] = senderBalance - amount;
        }
        _balances[recipient] += amount;

        emit Transfer(sender, recipient, amount);
    }

    /** @dev Creates `amount` tokens and assigns them to `account`, increasing
     * the total supply.
     *
     * Emits a {Transfer} event with `from` set to the zero address.
     *
     * Requirements:
     *
     * - `account` cannot be the zero address.
     */
    function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: mint to the zero address");

        _beforeTokenTransfer(address(0), account, amount);

        _totalSupply += amount;
        _balances[account] += amount;
        emit Transfer(address(0), account, amount);
    }

    /**
     * @dev Destroys `amount` tokens from `account`, reducing the
     * total supply.
     *
     * Emits a {Transfer} event with `to` set to the zero address.
     *
     * Requirements:
     *
     * - `account` cannot be the zero address.
     * - `account` must have at least `amount` tokens.
     */
    function _burn(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: burn from the zero address");

        _beforeTokenTransfer(account, address(0), amount);

        uint256 accountBalance = _balances[account];
        require(accountBalance >= amount, "ERC20: burn amount exceeds balance");
        unchecked {
            _balances[account] = accountBalance - amount;
        }
        _totalSupply -= amount;

        emit Transfer(account, address(0), amount);
    }

    /**
     * @dev Sets `amount` as the allowance of `spender` over the `owner` s tokens.
     *
     * This internal function is equivalent to `approve`, and can be used to
     * e.g. set automatic allowances for certain subsystems, etc.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `owner` cannot be the zero address.
     * - `spender` cannot be the zero address.
     */
    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    /**
     * @dev Hook that is called before any transfer of tokens. This includes
     * minting and burning.
     *
     * Calling conditions:
     *
     * - when `from` and `to` are both non-zero, `amount` of ``from``'s tokens
     * will be to transferred to `to`.
     * - when `from` is zero, `amount` tokens will be minted for `to`.
     * - when `to` is zero, `amount` of ``from``'s tokens will be burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {}
}

abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() {
        _setOwner(_msgSender());
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        _setOwner(address(0));
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _setOwner(newOwner);
    }

    function _setOwner(address newOwner) private {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}

library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies on extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        uint256 size;
        assembly {
            size := extcodesize(account)
        }
        return size > 0;
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        (bool success, ) = recipient.call{value: amount}("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain `call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value
    ) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        require(isContract(target), "Address: call to non-contract");

        (bool success, bytes memory returndata) = target.call{value: value}(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        return functionStaticCall(target, data, "Address: low-level static call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal view returns (bytes memory) {
        require(isContract(target), "Address: static call to non-contract");

        (bool success, bytes memory returndata) = target.staticcall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.4._
     */
    function functionDelegateCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionDelegateCall(target, data, "Address: low-level delegate call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.4._
     */
    function functionDelegateCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(isContract(target), "Address: delegate call to non-contract");

        (bool success, bytes memory returndata) = target.delegatecall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    function _verifyCallResult(
        bool success,
        bytes memory returndata,
        string memory errorMessage
    ) private pure returns (bytes memory) {
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}

library SafeERC20 {
    using Address for address;

    function safeTransfer(
        IERC20 token,
        address to,
        uint256 value
    ) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(
        IERC20 token,
        address from,
        address to,
        uint256 value
    ) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    /**
     * @dev Deprecated. This function has issues similar to the ones found in
     * {IERC20-approve}, and its usage is discouraged.
     *
     * Whenever possible, use {safeIncreaseAllowance} and
     * {safeDecreaseAllowance} instead.
     */
    function safeApprove(
        IERC20 token,
        address spender,
        uint256 value
    ) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        require(
            (value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(
        IERC20 token,
        address spender,
        uint256 value
    ) internal {
        uint256 newAllowance = token.allowance(address(this), spender) + value;
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(
        IERC20 token,
        address spender,
        uint256 value
    ) internal {
        unchecked {
            uint256 oldAllowance = token.allowance(address(this), spender);
            require(oldAllowance >= value, "SafeERC20: decreased allowance below zero");
            uint256 newAllowance = oldAllowance - value;
            _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
        }
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function _callOptionalReturn(IERC20 token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves. We use {Address.functionCall} to perform this call, which verifies that
        // the target address contains contract code and also asserts for success in the low-level call.

        bytes memory returndata = address(token).functionCall(data, "SafeERC20: low-level call failed");
        if (returndata.length > 0) {
            // Return data is optional
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract StakeHubToken is ERC20, Ownable {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;
    
    mapping(address => uint256) public stakeholderTotals;
    
    mapping(address => address) public approvedBallots;
    
    mapping(address => address) public approvedPools;
    
    
    
    /**
    * @notice Creates STKHB
    * @param _owner Sets the owner wallet address 
    * @param _supply Sets the initial supply of STKHB (Uses 18 decimal places).
    */
    constructor(address _owner, uint256 _supply) 
        ERC20 ("test", "test")
    { 
        _mint(_owner, _supply);
    }
    
    function approvePool(address _SP) public onlyOwner {
        approvedPools[_SP] = _SP;
    }
    
    function approveBallot(address _VB) public onlyOwner {
        approvedBallots[_VB] = _VB;
    }
    
    
    function viewStakeholderTotals(address _stakeholder) external view returns(uint256) {
        return stakeholderTotals[_stakeholder];
    }

    function addStakeholderTotals(address _SP, uint256 _newStakeAmount, address _stakeholder) external onlyStakePoolCall(_SP) isApprovedPool(_SP) {
        stakeholderTotals[_stakeholder] = stakeholderTotals[_stakeholder].add(_newStakeAmount);
    }
    
    function removeStakeholderTotals(address _SP, uint256 _stakeRemovalAmount, address _stakeholder) external onlyStakePoolCall(_SP) isApprovedPool(_SP) {
        stakeholderTotals[_stakeholder] = stakeholderTotals[_stakeholder].sub(_stakeRemovalAmount);
    }
    
    /**
    * @notice A method to burn newly staked amounts which can be reminted upon removing the stake.
    * @param _SP Address of the Stake Pool.
    * @param _stakeMaker Address of the user creating the stake.
    * @param _stake The size of the stake to be added.
    * Modifier -  onlyStakePoolCall(_SP) - requires that the message be sent from a stake pool function and does not allow this function to be called anywhere else.
    */
    function burnStake(address _SP, address _stakeMaker, uint256 _stake) external onlyStakePoolCall(_SP) isApprovedPool(_SP) {
         _burn(_stakeMaker, _stake);
    }
    
    function burnVote(address _VB, address _voter, uint256 _vote) external onlyVoteBallotCall(_VB) isApprovedBallot(_VB) {
        _burn(_voter, _vote);
    }
    
    /**
    * @notice A method to mint staked amounts when removing stakes.
    * @param _SP Address of the Stake Pool.
    * @param _stakeholder Address of the user removing the stake.
    * @param _stake The size of the stake to be removed.
    * Modifier -  onlyStakePoolCall(_SP) - requires that the message be sent from a stake pool function and does not allow this function to be called anywhere else.
    */
    function mintStakedAmount(address _SP, address _stakeholder, uint256 _stake) external onlyStakePoolCall(_SP) isApprovedPool(_SP) {
        _mint(_stakeholder, _stake);
    }
    
    /**
    * @notice A method to mint rewards from a current stake.
    * @param _SP Address of the Stake Pool.
    * @param _stakeholder Address of the user requesting rewards collection.
    * @param _rewards The reward total to be collected.
    * Modifier -  onlyStakePoolCall(_SP) - requires that the message be sent from a stake pool function and does not allow this function to be called anywhere else.
    */
    function mintRewards(address _SP, address _stakeholder, uint256 _rewards) external onlyStakePoolCall(_SP) isApprovedPool(_SP) {
        _mint(_stakeholder, _rewards);
    }
    
    /**
    * @notice onlyStakePoolCall(_SP) - requires that the message be sent from a stake pool function and does not allow this function to be called anywhere else.
    */
    modifier onlyStakePoolCall(address _SP) {
        require(msg.sender == _SP);
        _;
    }
    
    modifier isApprovedPool(address _SP) {
            require(approvedPools[_SP] == _SP);
            _;
    }
    
    modifier isApprovedBallot(address _VB) {
        require(approvedBallots[_VB] == _VB);
        _;    
    }
    
    modifier onlyVoteBallotCall(address _VB) {
        require(msg.sender == _VB);
        _;
    }
    
}

contract StakingPools is Ownable {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;
    
    uint256 public rewardRate;
    
    uint256 public rewardBlockTime;
    
    address public stakePool;
    
    address public SHF;
    
    address[] internal stakeholders;

    mapping(address => uint256) public stakes;

    mapping(address => uint256) internal rewards;
    
    mapping (address => uint256) internal stakeStart;
    
    
    constructor(address _STKHB) {
        SHF = _STKHB;
    }
    
    function setSPAddress(address _SP) public onlyOwner {
        stakePool = _SP;
    }
    
    /**
    * @notice A method for a stakeholder to create a stake.
    * @param _stakeMaker The stakeholder to create stakes for.
    * @param _stake The size of the stake to be created.
    * STAKE FEE - 0.5% - _stakedAmount includes a permanent burn of 0.5% of the total stake.
    */
    function createStake(address _stakeMaker, uint256 _stake)
        onlyStakeholder(_stakeMaker)
        public
    {
        StakeHubToken STKHB = StakeHubToken(SHF);
        _stake = _stake * 1e18;
        uint256 _stakedAmount;
        if(stakes[msg.sender] > 0) collectRewards(msg.sender);
        STKHB.burnStake(stakePool, _stakeMaker, _stake);
        _stakedAmount = _stake - (((_stake * 1e5) - ((_stake * 1e5) * (.995 * 1e5) / 1e5)) / 1e5);
        if(stakes[msg.sender] == 0) addStakeholder(msg.sender);
        stakes[msg.sender] = stakes[msg.sender].add(_stakedAmount);
        STKHB.addStakeholderTotals(stakePool, _stakedAmount, _stakeMaker);
        stakeStart[msg.sender] = block.timestamp;
    }

    /**
    * @notice A method for a stakeholder to remove a stake.
    * @param _stake The size of the stake to be removed.
    */
    function removeStake (address _stakeMaker, uint256 _stake)
        onlyStakeholder(_stakeMaker)
        validRemovalAmount(_stake)
        public
    {
        StakeHubToken STKHB = StakeHubToken(SHF);
        _stake = _stake * 1e18;
        collectRewards(msg.sender);
        stakes[msg.sender] = stakes[msg.sender].sub(_stake);
        STKHB.removeStakeholderTotals(stakePool, _stake, _stakeMaker);
        if(stakes[msg.sender] == 0) removeStakeholder(msg.sender);
        if(stakes[msg.sender] == 0) stakeStart[msg.sender] = 0;
        STKHB.mintStakedAmount(stakePool, _stakeMaker, _stake);
        
    }
    
    function removeFullStake(address _stakeMaker) public onlyStakeholder(_stakeMaker) {
        StakeHubToken STKHB = StakeHubToken(SHF);
        collectRewards(msg.sender);
        uint256 removalAmount;
        removalAmount = stakes[msg.sender];
        stakes[msg.sender] = 0;
        STKHB.removeStakeholderTotals(stakePool, removalAmount, _stakeMaker);
        removeStakeholder(msg.sender);
        STKHB.mintStakedAmount(stakePool, _stakeMaker, removalAmount);
    }

    /**
    * @notice A method to retrieve the stake for a stakeholder.
    * @param _stakeholder The stakeholder to retrieve the stake of.
    * @return uint256 The amount of STKHB staked.
    */
    function stakeOf(address _stakeholder)
        public
        view
        returns(uint256)
    {
        return stakes[_stakeholder];
    }

    /**
    * @notice A method to the aggregated stakes from all stakeholders.
    * @return uint256 The aggregated stakes from all stakeholders.
    */
    function totalStakes()
        public
        view
        returns(uint256)
    {
        uint256 _totalStakes = 0;
        for (uint256 s = 0; s < stakeholders.length; s += 1){
            _totalStakes = _totalStakes.add(stakes[stakeholders[s]]);
        }
        return _totalStakes;
    }
    
    /**
    * @notice A method to the aggregated rewards from all stakeholders.
    * @return uint256 The aggregated rewards from all stakeholders.
    */
    function totalRewards()
        public
        view
        returns(uint256)
    {
        uint256 _totalRewards = 0;
        for (uint256 s = 0; s < stakeholders.length; s += 1){
            _totalRewards = _totalRewards.add(calculateReward(stakeholders[s]));
        }
        return _totalRewards;
    }

    // ---------- STAKEHOLDERS ----------

    /**
    * @notice A method to check if an address is a stakeholder.
    * @param _address The address to verify.
    * @return bool, uint256 Whether the address is a stakeholder, 
    * and if so its position in the stakeholders array.
    */
    function isStakeholder(address _address)
        public
        view
        returns(bool, uint256)
    {
        for (uint256 s = 0; s < stakeholders.length; s += 1){
            if (_address == stakeholders[s]) return (true, s);
        }
        return (false, 0);
    }

    /**
    * @notice A method to add a stakeholder.
    * @param _stakeholder The stakeholder to add.
    */
    function addStakeholder(address _stakeholder)
        public
    {
        (bool _isStakeholder, ) = isStakeholder(_stakeholder);
        if(!_isStakeholder) stakeholders.push(_stakeholder);
    }

    /**
    * @notice A method to remove a stakeholder.
    * @param _stakeholder The stakeholder to remove.
    */
    function removeStakeholder(address _stakeholder)
        public
    {
        (bool _isStakeholder, uint256 s) = isStakeholder(_stakeholder);
        if(_isStakeholder){
            stakeholders[s] = stakeholders[stakeholders.length - 1];
            stakeholders.pop();
        } 
    }

    // ---------- REWARDS ----------
    
    /**
    * @notice A method to allow a stakeholder to check their rewards.
    * @param _stakeholder The stakeholder to check rewards for.
    */
    function rewardOf(address _stakeholder) 
        public
        view
        returns(uint256)
    {
        return calculateReward(_stakeholder);
    }

    /** 
    * @notice A method that calculates the rewards for each stakeholder.
    * @param _stakeholder The stakeholder to calculate rewards for.
    */
    function calculateReward(address _stakeholder)
        public
        view
        returns(uint256)
    {
        uint256 newRewards;
        
        newRewards = (stakes[_stakeholder] * (((block.timestamp - stakeStart[_stakeholder]) / rewardBlockTime) * rewardRate) / 1e15);
        return newRewards;    
    }
    
    /**
    * @notice A method to attribute and distrbute rewards
    * @param _stakeholder The stakeholder to attribute rewards to.
    */
    function collectRewards(address _stakeholder)
        public
    {
        for (uint256 s = 0; s < stakeholders.length; s += 1){
            StakeHubToken STKHB = StakeHubToken(SHF);
            address stakeholder = _stakeholder;
            uint256 reward = calculateReward(stakeholder);
            rewards[stakeholder] = rewards[stakeholder].add(reward);
            stakeStart[_stakeholder] = block.timestamp;
            rewards[_stakeholder] = 0;
            STKHB.mintRewards(stakePool, _stakeholder, reward);
        }
    }
    
    /**
    * @notice A method to change the APY of the contract
    * @param _rewardRate uint256 that defines the apy as calcualted by (_rewardRate *1e3 *2880 *365) = APY
    */
    function setRewardRate(uint256 _rewardRate) public onlyOwner returns (uint256) {
        for (uint256 s = 0; s < stakeholders.length; s += 1){
            collectRewards(stakeholders[s]);
        }
        return rewardRate = _rewardRate * 1e3;
    }
    
    /**
    * @notice A method to change the reward block time.
    * @param _time uint256 in seconds.
    */
    function setRewardBlockTime(uint256 _time) public onlyOwner returns (uint256) {
        return rewardBlockTime = _time;
    }
    
    /**
    * @notice A modifier to verifiy that a user is a current stakeholder prior to accepting the transaction.
    * @param _stakeholder Address of the stakeholder. 
    */
    modifier onlyCurrentStaker(address _stakeholder) {
        require(stakeOf(msg.sender) != 0);
        _;
    }
    
    modifier validRemovalAmount(uint256 _stake) {
        uint256 stake;
        stake = _stake * 1e18;
        require(stakes[msg.sender] >= stake);
        _;
    }
    
    /**
     * @notice A modifier to prevent anyone but the account owner from executing transactions with this modifier.
     */
    modifier onlyStakeholder(address _stakeMaker) {
        require(_stakeMaker == msg.sender);
        _;
    }
}

contract NonburnVoting is Ownable {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;
    
    address public stkhb;
    
    address public thisContract;
    
    //uint256 for nonburn voting //
    uint256 public nonburnYesVoteAmount;
    uint256 public nonburnNoVoteAmount;
    uint256 public nonburnVotingBlockEnd;
    
    mapping (address => uint256) internal voterStatus;
    
    constructor(address _STKHB) {
        stkhb = _STKHB;
    }
    
    function setThisContract(address _contract) public onlyOwner {
        thisContract = _contract;
    }

    // ---------- VOTING THAT DOES NOT BURN STKHB ----------
    //For all functions below STKHB will be permanently burned\
    
    /**
     * @notice A method to start a voting period for non burable votes - Resets previous vote blockers and resets preivous vote amounts
     * @param _time Defines the amount of time (in seconds) that the vote will be open
     */ 
    function setNonBurnVotingPeriod(uint256 _time) public onlyOwner {
        nonburnVotingBlockEnd = block.timestamp + _time;
        nonburnYesVoteAmount = 0;
        nonburnNoVoteAmount = 0;
    }
    
    /**
     * @notice A method to vote yes based on your total stakeholdings
     * @param _stakeholder Defines the address submitting the vote
     */ 
    function nonburnVoteYes(address _stakeholder) public checkVoteStatus() inNonburnBlockperiod onlyCurrentStaker(_stakeholder) {
        StakeHubToken STKHB = StakeHubToken(stkhb);
        uint256 _nonburnVoteYesAmount;
        _nonburnVoteYesAmount = STKHB.viewStakeholderTotals(_stakeholder);
        nonburnYesVoteAmount = nonburnYesVoteAmount + _nonburnVoteYesAmount;
        voterStatus[msg.sender] = 1;
    }
    
    /**
     * @notice A method to vote no based on your total stakeholdings
     * @param _stakeholder Defines the address submitting the vote
     */ 
    function nonburnVoteNo(address _stakeholder) public checkVoteStatus() inNonburnBlockperiod() onlyCurrentStaker(_stakeholder) {
        StakeHubToken STKHB = StakeHubToken(stkhb);
        uint256 _nonburnVoteNoAmount;
        _nonburnVoteNoAmount = STKHB.viewStakeholderTotals(_stakeholder);
        nonburnNoVoteAmount = nonburnNoVoteAmount + _nonburnVoteNoAmount;
        voterStatus[msg.sender] = 1;
    }
    
    /**
     * @notice A method to only allow voting during the defined block period
     */ 
    modifier inNonburnBlockperiod() {
        require(block.timestamp < nonburnVotingBlockEnd);
        _;
    }
    
    /**
     * @notice A method to only allow an address to vote once
     */ 
    modifier checkVoteStatus() {
        require(voterStatus[msg.sender] != 1);
        _;
    }
    
    modifier onlyCurrentStaker(address _stakeholder) {
        StakeHubToken STKHB = StakeHubToken(stkhb);
        require(STKHB.viewStakeholderTotals(_stakeholder) > 0);
        _;
    }
}

contract BurnVoting is Ownable {
     using SafeMath for uint256;
    using SafeERC20 for IERC20;
    
    address public stkhb;
    
    address public thisContract;
    
    //uint256 for burn voting //
    uint256 public votingBlockEnd;
    uint256 public yesVoteAmount;
    uint256 public noVoteAmount;
    uint256 public minimumVoteAmount;
    
    constructor(address _STKHB) {
        stkhb = _STKHB;
    }
    
    function setThisContract(address _contract) public onlyOwner {
        thisContract = _contract;
    }

     // ---------- VOTING THAT BURNS STKHB ----------
    //For all functions below STKHB will be permanently burned
    
    /**
     * @notice A method to start a voting period for burnable votes & reset previous vote tallys
     */
    function setVotingPeriod(uint256 _time) public onlyOwner {
        votingBlockEnd = block.timestamp + _time;
        yesVoteAmount = 0;
        noVoteAmount = 0;
    }
     
    /**
     * @notice A method to vote yes and burn the amount voted
     * @param _voteAmount Defines the number of tokens to burn
     */ 
    function voteYes(uint256 _voteAmount) public inBlockperiod() checkVoteAmount(_voteAmount) returns(uint256) {
        StakeHubToken STKHB = StakeHubToken(stkhb);
        uint256 voteAmount = _voteAmount;
        STKHB.burnVote(thisContract, msg.sender, voteAmount);
        return yesVoteAmount = yesVoteAmount + voteAmount;
    }
     
    /**
     * @notice A method to vote no and burn the amount voted
     * @param _voteAmount Defines the number of tokens to burn
     */ 
    function voteNo(uint256 _voteAmount) public inBlockperiod() checkVoteAmount(_voteAmount) returns(uint256) {
        StakeHubToken STKHB = StakeHubToken(stkhb);
        uint256 voteAmount = _voteAmount;
        STKHB.burnVote(thisContract, msg.sender, voteAmount);
        return noVoteAmount = noVoteAmount + voteAmount;
    }
    
    /**
     * @notice A method to set the minimum number of tokens allowed to participate in a vote
     * @param _setVoteAmount Defines the minimum number of tokens allowed
     */  
    function setMinimumVoteAmount(uint256 _setVoteAmount) public onlyOwner {
        minimumVoteAmount = _setVoteAmount * 1e18;
    }
    
    /**
     * @notice A method to only allow vote submission during the alloted voting time
     */ 
    modifier inBlockperiod() {
        require(block.timestamp < votingBlockEnd);
        _;
    }
    
    /**
     * @notice A method to only allow vote amounts to meet or exceed the minimum vote amount
     */ 
    modifier checkVoteAmount(uint256 _voteAmount) {
        require(_voteAmount >= (minimumVoteAmount));
        _;
    }
}
